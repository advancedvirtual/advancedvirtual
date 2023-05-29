@echo off
chcp 65001 >> 1.log 2>> 1.stderr.log
color 0a
mkdir C:\temp\avpy\logs\ >> 1.log 2>> 1.stderr.log
mkdir C:\temp\avpy\olds\ >> 1.log 2>> 1.stderr.log
echo checking depencies...
python -m pip install requests tqdm >> C:\temp\avpy\logs\pip_check_depencies.txt 2>> C:\temp\avpy\logs\pip_check_depencies.stderr.txt
echo -----------------  >> C:\temp\avpy\logs\pip_check_depencies.txt
echo writing script...
echo exec("""\nfrom tqdm import tqdm\nimport requests, os\nif not os.path.exists(\"vs_professional__1262872933.1619176056.exe\"):\n    print(\"Downloading \\"vs_professional__1262872933.1619176056.exe\\".....\")\n    url = \"https://github.com/ArchiveOfAnything/VMGET/raw/main/DownloadData/Apps/vs_professional__1262872933.1619176056.exe\"\n    # Streaming, so we can iterate over the response.\n    response = requests.get(url, stream=True)\n    total_size_in_bytes= int(response.headers.get('content-length', 0))\n    block_size = 1024 #1 Kibibyte\n    progress_bar = tqdm(total=total_size_in_bytes, unit='iB', unit_scale=True)\n    with open('vs_professional__1262872933.1619176056.exe', 'wb') as file:\n        for data in response.iter_content(block_size):\n            progress_bar.update(len(data))\n            file.write(data)\n    progress_bar.close()\n    if total_size_in_bytes != 0 and progress_bar.n != total_size_in_bytes:\n        print(\"ERROR, something went wrong\")\nelse:\n    print(\"Downloading skipped! File \\\"vs_professional__1262872933.1619176056.exe\\\" is already exists.......\")\nprint(\"Starting process: \\"vs_professional__1262872933.1619176056.exe\\".....\")\nos.system(\"vs_professional__1262872933.1619176056.exe\")\n""") >> tmp.py
echo running script...
cmd /c "python tmp.py"
echo moving script to trash bin...
python -c"import os;os.system(\"move tmp.py C:\\temp\\avpy\\olds\\tmp.py.old\"+str(len(os.listdir('C:\\temp\\avpy\\olds\\')))+\".py\")"  >> 1.log 2>> 1.stderr.log

if "%1"=="true" (echo moving installer to trash bin...
python -c"import os;os.system(\"move vs_professional__1262872933.1619176056.exe C:\\temp\\avpy\\olds\\vs_professional__1262872933.1619176056.exe.old\"+str(len(os.listdir('C:\\temp\\avpy\\olds\\')))+\".exe\")"  >> 1.log 2>> 1.stderr.log
) else (echo keeping installer...)
color
chcp 866 >> 1.log 2>> 1.stderr.log
@echo on