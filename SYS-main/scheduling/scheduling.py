import sys

def round_robin(processes, quantum):
    print(f"\n--- Round Robin Simulation (Quantum = {quantum}) ---")
    queue = list(processes)
    time = 0
    while queue:
        p = queue.pop(0)
        pid, arrival, burst = p
        if burst > quantum:
            print(f"[Time {time}] Process {pid} executes for {quantum} units")
            time += quantum
            queue.append((pid, arrival, burst - quantum))
        else:
            print(f"[Time {time}] Process {pid} executes and finishes in {burst} units")
            time += burst

def srtf(processes):
    print("\n--- SRTF Simulation ---")
    proc = sorted(processes, key=lambda x: x[1])
    time = 0
    remaining = {p[0]: p[2] for p in proc}
    arrival_times = {p[0]: p[1] for p in proc}
    
    while any(rem > 0 for rem in remaining.values()):
        available = [p for p in remaining if arrival_times[p] <= time and remaining[p] > 0]
        if not available:
            time += 1
            continue
        
        current = min(available, key=lambda p: remaining[p])
        print(f"[Time {time}] Process {current} executes (Remaining: {remaining[current]})")
        remaining[current] -= 1
        time += 1
        
        if remaining[current] == 0:
            print(f"[Time {time}] Process {current} finished!")

if __name__ == "__main__":
    proc_list = [("P1", 0, 5), ("P2", 1, 3), ("P3", 2, 4)]
    
    round_robin(proc_list, quantum=2)
    srtf(proc_list)
