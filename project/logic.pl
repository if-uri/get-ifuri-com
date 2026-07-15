% ── Project Metadata ─────────────────────────────────────
project_metadata('get-ifuri-com', '0.0.0', 'python').

% ── Project Files ────────────────────────────────────────
project_file('app.doql.less', 35, 'less').
project_file('ifuri-ecobar.js', 109, 'javascript').
project_file('project.sh', 66, 'shell').
project_file('scripts/check_site.py', 30, 'python').
project_file('scripts/deploy-plesk.sh', 43, 'shell').
project_file('tree.sh', 5, 'shell').

% ── Python Functions ─────────────────────────────────────
python_function('scripts/check_site.py', 'main', 0, 8, 6).

% ── Python Classes ───────────────────────────────────────
python_class('scripts/check_site.py', 'Bal').
python_method('Bal', '__init__', 0, 1, 2).
python_method('Bal', 'handle_starttag', 2, 2, 1).
python_method('Bal', 'handle_endtag', 1, 2, 1).

% ── Dependencies ─────────────────────────────────────────

% ── Makefile Targets ─────────────────────────────────────
makefile_target('help', '').
makefile_target('serve', '').
makefile_target('test', '').
makefile_target('deploy', '').

% ── Taskfile Tasks ───────────────────────────────────────

% ── Environment Variables ────────────────────────────────

% ── TestQL Scenarios ─────────────────────────────────────

% ── Semantic Facts from SUMD.md ──────────────────────────
sumd_declared_file('app.doql.less', 'doql').
sumd_declared_file('project/map.toon.yaml', 'analysis').
sumd_declared_file('project/logic.pl', 'analysis').
sumd_declared_file('project/calls.toon.yaml', 'analysis').
sumd_interface('web', '').
sumd_workflow('serve', 'manual').
sumd_workflow_step('serve', 1, 'python3 -m http.server $(PORT)').
sumd_workflow('test', 'manual').
sumd_workflow_step('test', 1, 'python3 scripts/check_site.py').
sumd_workflow('deploy', 'manual').
sumd_workflow_step('deploy', 1, 'bash scripts/deploy-plesk.sh').

