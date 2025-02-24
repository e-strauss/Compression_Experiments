
echo 1 | sudo tee /proc/sys/kernel/perf_event_paranoid
sudo sysctl kernel.perf_event_paranoid=1
sudo sysctl kernel.kptr_restrict=0
