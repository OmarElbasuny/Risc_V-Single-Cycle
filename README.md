# RISC-V Processor with Simple Cache System

## Introduction

This project implements a simple caching system for the RISC-V processor. The primary objective is to integrate the caching system with the single-cycle implementation of the processor. The project focuses solely on caching data memory, leaving instruction memory unaffected. Here are the key aspects and assumptions:

- Data memory caching only, with no impact on instruction memory.
- Single level of caching.
- Main memory capacity: 4 Kbytes (word addressable using 10 bits or byte addressable using 12 bits).
- Main memory access time: 4 clock cycles.
- Data cache geometry: (512, 16, 1) - total cache capacity of 512 bytes, with cache blocks of 16 bytes and direct mapping.
- Write-through and write-around policies for write hit and miss handling respectively, with no write buffers.
- LW instructions will stall the processor only in case of a cache miss.

The caching system consists of a cache memory module, a cache controller module, and the data memory module. The cache controller handles hit and miss decisions, as well as stall signals to pause the processor during memory operations.

## System Overview

The memory system replaces the data memory in the single-cycle implementation. It includes the cache memory module, cache controller module, and data memory module. The cache controller manages cache operations based on the requested memory address. Here's a summary of the cache controller's behavior:

1. **Read Hit**: No stall necessary, data is read from the cache.
2. **Read Miss**: Stall signal is asserted until data is fetched from main memory and stored in the cache.
3. **Write Hit**: Stall signal is asserted until data is written to both cache and main memory (write-through policy).
4. **Write Miss**: Stall signal is asserted until data is written to main memory only (write-around policy).

## Appendix

Caches speed up data fetching by storing frequently accessed data closer to the CPU. Direct mapping is used for mapping data blocks from memory to cache. When a cache miss occurs, the cache controller fetches the data from main memory and updates the cache. Address bits are used to determine cache block placement.
