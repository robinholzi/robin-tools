"""
Windows %APPDATA%\Code
macOS $HOME/Library/Application\ Support/Code
Linux $HOME/.config/Code
For VS Code Server, the default user data directory should be ~/.vscode-server/data
"""

cd /local/home/rholzinger1/.vscode-server/data/User/History
find . -type f -not -name "\*.txt" -exec cat {} + > combined_file.txt
grep -rl "description="Yearbook pipeline for comparing trigger policies"," . | while read -r file; do stat --format="%y %n" "$file"; done

docker exec -it $(docker compose ps -q mssqlkit_db) /bin/bash

select samples.dataset_id, datasets.name, count(distinct(sample_id)) from samples join datasets on samples.dataset_id = datasets.dataset_id group by samples.dataset_id, datasets.name;

delete from datasets where id >= 11;
delete from datasets where dataset_id >= 11;
