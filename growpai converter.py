# make sure the file you want to convert is named input.lua and is on desktop

import re
import os
import webbrowser


def process_lua_script(input_file, output_folder):
    with open(input_file, "r") as file:
        lua_code = file.readlines()

    issues = []
    updated_code = []

    for line_num, line in enumerate(lua_code, start=1):
        original_line = line

        if re.search(r'\bGetGhost\b', line):
            issues.append(f"Line {line_num}: Please edit GetGhost function.")
        
        if re.search(r'AddCallback\s*\(\s*"[^"]+"\s*,\s*"OnUpdate"', line, re.IGNORECASE):
            issues.append(f"Line {line_num}: Please edit OnUpdate callback.")
        
        if re.search(r'\btimer\b', line):
            issues.append(f"Line {line_num}: Timer library usage detected. Please verify Timer functions.")
        
        if re.search(r'EditToggle\s*\(', line):
            if re.search(r'Antibounce', line, re.IGNORECASE):
                line = re.sub(r'Antibounce', 'AntiBounce', line, flags=re.IGNORECASE)
            if re.search(r'Autocollect', line, re.IGNORECASE):
                line = re.sub(r'Autocollect', 'AutoCollect', line, flags=re.IGNORECASE)
            if re.search(r'Antiportal', line, re.IGNORECASE):
                line = re.sub(r'Antiportal', 'AntiPortal', line, flags=re.IGNORECASE)
            if re.search(r'Stop Luascript|Execute Luascript|MenuToggle', line, re.IGNORECASE):
                issues.append(f"Line {line_num}: Invalid EditToggle usage: {line.strip()}")
                line = f"-- {line.strip()}\n"
        
        line = re.sub(r'\bGetIteminfo\b', 'GetItemInfo', line)
        
        if re.search(r'\.world\b', line) and not re.search(r'GetLocal\(\)\.world\b', line):
            issues.append(f"Line {line_num}: Use GetWorld instead of .world.")
        
        if re.search(r'GetLocal\(\)\.world\b', line):
            line = re.sub(r'GetLocal\(\)\.world', 'GetWorld().name', line)
        
        if re.search(r'\.flags2\b', line):
            issues.append(f"Line {line_num}: .flags2 usage detected. Please verify its usage.")
        
        if re.search(r'\.(fire|water)\b', line):
            issues.append(f"Line {line_num}: .{re.search(r'\.(fire|water)\b', line).group(1)} usage detected. Please verify its usage.")
        
        if re.search(r'\.ready\b', line):
            issues.append(f"Line {line_num}: Use IsReady instead of .ready.")
            line = re.sub(r'\.ready\b', '.IsReady()', line)
        
        line = re.sub(r'\bRemoveCallbacks\b', 'RemoveHooks', line)
        line = re.sub(r'\bRemoveCallback\b', 'RemoveHook', line)
        line = re.sub(r'\bAddCallback\b', 'AddHook', line)

        line = re.sub(
            r'AddHook\s*\(\s*"(.*?)"\s*,\s*"(.*?)"\s*,\s*(.*?)\s*\)',
            lambda m: f'AddHook("{m.group(2)}", "{m.group(1)}", {m.group(3)})',
            line
        )

        updated_code.append(line)

    comment_block = "--[[\n" + "\n".join(issues) + "\n]]\n\n" if issues else ""

    output_file = os.path.join(output_folder, "output.lua")
    with open(output_file, "w") as file:
        file.write(comment_block)
        file.writelines(updated_code)

    return output_file


input_file = os.path.expanduser("~/Desktop/input.lua")
output_folder = os.path.expanduser("~/Desktop")

if os.path.exists(input_file):
    output_file = process_lua_script(input_file, output_folder)
    webbrowser.open(output_file)
else:
    print("Input file not found on Desktop.")