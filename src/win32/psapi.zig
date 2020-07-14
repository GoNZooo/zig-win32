const win32 = @import("./c.zig");

pub const EmptyWorkingSet = K32EmptyWorkingSet;
pub extern "kernel32" fn K32EmptyWorkingSet(hProcess: win32.HANDLE) win32.BOOL;

pub const EnumDeviceDrivers = K32EnumDeviceDrivers;
pub extern "kernel32" fn K32EnumDeviceDrivers(
    lpImageBase: [*c]win32.LPVOID,
    cb: win32.DWORD,
    lpcbNeeded: win32.LPDWORD,
) win32.BOOL;

pub const EnumPageFiles = EnumPageFilesA;
pub const EnumPageFilesA = K32EnumPageFilesA;
pub const EnumPageFilesW = K32EnumPageFilesW;
pub extern "kernel32" fn K32EnumPageFilesW(
    pCallBackRoutine: PENUM_PAGE_FILE_CALLBACKW,
    pContext: win32.LPVOID,
) win32.BOOL;
pub extern "kernel32" fn K32EnumPageFilesA(
    pCallBackRoutine: PENUM_PAGE_FILE_CALLBACKA,
    pContext: win32.LPVOID,
) win32.BOOL;

pub const PENUM_PAGE_FILE_CALLBACKW = ?fn (
    win32.LPVOID,
    PENUM_PAGE_FILE_INFORMATION,
    win32.LPCWSTR,
) callconv(.C) win32.BOOL;
pub const PENUM_PAGE_FILE_CALLBACKA = ?fn (
    win32.LPVOID,
    PENUM_PAGE_FILE_INFORMATION,
    win32.LPCSTR,
) callconv(.C) win32.BOOL;

pub const struct__ENUM_PAGE_FILE_INFORMATION = extern struct {
    cb: win32.DWORD,
    Reserved: win32.DWORD,
    TotalSize: win32.SIZE_T,
    TotalInUse: win32.SIZE_T,
    PeakUsage: win32.SIZE_T,
};
pub const ENUM_PAGE_FILE_INFORMATION = struct__ENUM_PAGE_FILE_INFORMATION;
pub const PENUM_PAGE_FILE_INFORMATION = [*c]struct__ENUM_PAGE_FILE_INFORMATION;

pub extern "kernel32" fn K32EnumProcesses(
    lpidProcess: [*c]win32.DWORD,
    cb: win32.DWORD,
    lpcbNeeded: win32.LPDWORD,
) win32.BOOL;
pub const EnumProcesses = K32EnumProcesses;

pub const EnumProcessModulesEx = K32EnumProcessModulesEx;
pub const EnumProcessModules = K32EnumProcessModules;

pub extern "kernel32" fn K32EnumProcessModules(
    hProcess: win32.HANDLE,
    lphModule: [*c]win32.HMODULE,
    cb: win32.DWORD,
    lpcbNeeded: win32.LPDWORD,
) win32.BOOL;
pub extern "kernel32" fn K32EnumProcessModulesEx(
    hProcess: win32.HANDLE,
    lphModule: [*c]win32.HMODULE,
    cb: win32.DWORD,
    lpcbNeeded: win32.LPDWORD,
    dwFilterFlag: win32.DWORD,
) win32.BOOL;

pub extern "kernel32" fn K32GetDeviceDriverBaseNameA(
    ImageBase: win32.LPVOID,
    lpFilename: win32.LPSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub extern "kernel32" fn K32GetDeviceDriverBaseNameW(
    ImageBase: win32.LPVOID,
    lpBaseName: win32.LPWSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub const GetDeviceDriverBaseName = GetDeviceDriverBaseNameA;
pub const GetDeviceDriverBaseNameA = K32GetDeviceDriverBaseNameA;
pub const GetDeviceDriverBaseNameW = K32GetDeviceDriverBaseNameW;

pub extern "kernel32" fn K32GetDeviceDriverFileNameA(
    ImageBase: win32.LPVOID,
    lpFilename: win32.LPSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub extern "kernel32" fn K32GetDeviceDriverFileNameW(
    ImageBase: win32.LPVOID,
    lpFilename: win32.LPWSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub const GetDeviceDriverFileNameA = K32GetDeviceDriverFileNameA;
pub const GetDeviceDriverFileName = GetDeviceDriverFileNameA;
pub const GetDeviceDriverFileNameW = K32GetDeviceDriverFileNameW;

pub extern "kernel32" fn K32GetMappedFileNameW(
    hProcess: win32.HANDLE,
    lpv: win32.LPVOID,
    lpFilename: win32.LPWSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub extern "kernel32" fn K32GetMappedFileNameA(
    hProcess: win32.HANDLE,
    lpv: win32.LPVOID,
    lpFilename: win32.LPSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub const GetMappedFileNameW = K32GetMappedFileNameW;
pub const GetMappedFileNameA = K32GetMappedFileNameA;
pub const GetMappedFileName = GetMappedFileNameA;

pub extern "kernel32" fn K32GetModuleBaseNameA(
    hProcess: win32.HANDLE,
    hModule: win32.HMODULE,
    lpBaseName: win32.LPSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub extern "kernel32" fn K32GetModuleBaseNameW(
    hProcess: win32.HANDLE,
    hModule: win32.HMODULE,
    lpBaseName: win32.LPWSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub extern "kernel32" fn K32GetModuleFileNameExA(
    hProcess: win32.HANDLE,
    hModule: win32.HMODULE,
    lpFilename: win32.LPSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub extern "kernel32" fn K32GetModuleFileNameExW(
    hProcess: win32.HANDLE,
    hModule: win32.HMODULE,
    lpFilename: win32.LPWSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub extern "kernel32" fn GetModuleFileNameA(
    hModule: win32.HMODULE,
    lpFilename: win32.LPSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub extern "kernel32" fn GetModuleFileNameW(
    hModule: win32.HMODULE,
    lpFilename: win32.LPWSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub const GetModuleBaseNameW = K32GetModuleBaseNameW;
pub const GetModuleBaseName = GetModuleBaseNameA;
pub const GetModuleBaseNameA = K32GetModuleBaseNameA;
pub const GetModuleFileName = GetModuleFileNameA;
pub const GetModuleFileNameEx = GetModuleFileNameExA;
pub const GetModuleFileNameExA = K32GetModuleFileNameExA;
pub const GetModuleFileNameExW = K32GetModuleFileNameExW;

pub extern "kernel32" fn K32GetModuleInformation(
    hProcess: win32.HANDLE,
    hModule: win32.HMODULE,
    lpmodinfo: LPMODULEINFO,
    cb: win32.DWORD,
) BOOL;
pub const GetModuleInformation = K32GetModuleInformation;

pub const struct__MODULEINFO = extern struct {
    lpBaseOfDll: win32.LPVOID,
    SizeOfImage: win32.DWORD,
    EntryPoint: win32.LPVOID,
};
pub const MODULEINFO = struct__MODULEINFO;
pub const LPMODULEINFO = [*c]struct__MODULEINFO;

pub extern "kernel32" fn K32GetPerformanceInfo(
    pPerformanceInformation: PPERFORMANCE_INFORMATION,
    cb: win32.DWORD,
) win32.BOOL;
pub const GetPerformanceInfo = K32GetPerformanceInfo;

pub const struct__PERFORMANCE_INFORMATION = extern struct {
    cb: win32.DWORD,
    CommitTotal: win32.SIZE_T,
    CommitLimit: win32.SIZE_T,
    CommitPeak: win32.SIZE_T,
    PhysicalTotal: win32.SIZE_T,
    PhysicalAvailable: win32.SIZE_T,
    SystemCache: win32.SIZE_T,
    KernelTotal: win32.SIZE_T,
    KernelPaged: win32.SIZE_T,
    KernelNonpaged: win32.SIZE_T,
    PageSize: win32.SIZE_T,
    HandleCount: win32.DWORD,
    ProcessCount: win32.DWORD,
    ThreadCount: win32.DWORD,
};
pub const PERFORMANCE_INFORMATION = struct__PERFORMANCE_INFORMATION;
pub const PPERFORMANCE_INFORMATION = [*c]struct__PERFORMANCE_INFORMATION;
pub const PERFORMACE_INFORMATION = struct__PERFORMANCE_INFORMATION;
pub const PPERFORMACE_INFORMATION = [*c]struct__PERFORMANCE_INFORMATION;

pub extern "kernel32" fn K32GetProcessImageFileNameA(
    hProcess: win32.HANDLE,
    lpImageFileName: win32.LPSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub extern "kernel32" fn K32GetProcessImageFileNameW(
    hProcess: win32.HANDLE,
    lpImageFileName: win32.LPWSTR,
    nSize: win32.DWORD,
) win32.DWORD;
pub const GetProcessImageFileNameA = K32GetProcessImageFileNameA;
pub const GetProcessImageFileNameW = K32GetProcessImageFileNameW;
pub const GetProcessImageFileName = GetProcessImageFileNameA;

pub extern "kernel32" fn K32GetProcessMemoryInfo(
    Process: win32.HANDLE,
    ppsmemCounters: PPROCESS_MEMORY_COUNTERS,
    cb: win32.DWORD,
) win32.BOOL;
pub const GetProcessMemoryInfo = K32GetProcessMemoryInfo;

pub const struct__PROCESS_MEMORY_COUNTERS = extern struct {
    cb: win32.DWORD,
    PageFaultCount: win32.DWORD,
    PeakWorkingSetSize: win32.SIZE_T,
    WorkingSetSize: win32.SIZE_T,
    QuotaPeakPagedPoolUsage: win32.SIZE_T,
    QuotaPagedPoolUsage: win32.SIZE_T,
    QuotaPeakNonPagedPoolUsage: win32.SIZE_T,
    QuotaNonPagedPoolUsage: win32.SIZE_T,
    PagefileUsage: win32.SIZE_T,
    PeakPagefileUsage: win32.SIZE_T,
};
pub const PROCESS_MEMORY_COUNTERS = struct__PROCESS_MEMORY_COUNTERS;
pub const PPROCESS_MEMORY_COUNTERS = [*c]PROCESS_MEMORY_COUNTERS;
pub const struct__PROCESS_MEMORY_COUNTERS_EX = extern struct {
    cb: win32.DWORD,
    PageFaultCount: win32.DWORD,
    PeakWorkingSetSize: win32.SIZE_T,
    WorkingSetSize: win32.SIZE_T,
    QuotaPeakPagedPoolUsage: win32.SIZE_T,
    QuotaPagedPoolUsage: win32.SIZE_T,
    QuotaPeakNonPagedPoolUsage: win32.SIZE_T,
    QuotaNonPagedPoolUsage: win32.SIZE_T,
    PagefileUsage: win32.SIZE_T,
    PeakPagefileUsage: win32.SIZE_T,
    PrivateUsage: win32.SIZE_T,
};
pub const PROCESS_MEMORY_COUNTERS_EX = struct__PROCESS_MEMORY_COUNTERS_EX;
pub const PPROCESS_MEMORY_COUNTERS_EX = [*c]PROCESS_MEMORY_COUNTERS_EX;

pub extern "kernel32" fn K32QueryWorkingSet(
    hProcess: win32.HANDLE,
    pv: win32.PVOID,
    cb: win32.DWORD,
) win32.BOOL;
pub extern "kernel32" fn K32QueryWorkingSetEx(
    hProcess: win32.HANDLE,
    pv: win32.PVOID,
    cb: win32.DWORD,
) win32.BOOL;
pub const QueryWorkingSetEx = K32QueryWorkingSetEx;
pub const QueryWorkingSet = K32QueryWorkingSet;

pub extern "kernel32" fn K32InitializeProcessForWsWatch(hProcess: win32.HANDLE) win32.BOOL;
pub const InitializeProcessForWsWatch = K32InitializeProcessForWsWatch;

pub extern "kernel32" fn K32GetWsChanges(
    hProcess: win32.HANDLE,
    lpWatchInfo: PPSAPI_WS_WATCH_INFORMATION,
    cb: win32.DWORD,
) win32.BOOL;
pub extern "kernel32" fn K32GetWsChangesEx(
    hProcess: win32.HANDLE,
    lpWatchInfoEx: PPSAPI_WS_WATCH_INFORMATION_EX,
    cb: win32.PDWORD,
) win32.BOOL;

pub const struct__PSAPI_WS_WATCH_INFORMATION = extern struct {
    FaultingPc: win32.LPVOID,
    FaultingVa: win32.LPVOID,
};
pub const PSAPI_WS_WATCH_INFORMATION = struct__PSAPI_WS_WATCH_INFORMATION;
pub const PPSAPI_WS_WATCH_INFORMATION = [*c]struct__PSAPI_WS_WATCH_INFORMATION;
pub const struct__PSAPI_WS_WATCH_INFORMATION_EX = extern struct {
    BasicInfo: PSAPI_WS_WATCH_INFORMATION,
    FaultingThreadId: win32.ULONG_PTR,
    Flags: win32.ULONG_PTR,
};
pub const PSAPI_WS_WATCH_INFORMATION_EX = struct__PSAPI_WS_WATCH_INFORMATION_EX;
pub const PPSAPI_WS_WATCH_INFORMATION_EX = [*c]struct__PSAPI_WS_WATCH_INFORMATION_EX;

const struct_unnamed_258 = @Type(.Opaque); // C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\um\psapi.h:277:19: warning: struct demoted to opaque type - has bitfield
pub const union__PSAPI_WORKING_SET_BLOCK = extern union {
    Flags: win32.ULONG_PTR,
    unnamed_0: struct_unnamed_258,
};
pub const PSAPI_WORKING_SET_BLOCK = union__PSAPI_WORKING_SET_BLOCK;
pub const PPSAPI_WORKING_SET_BLOCK = [*c]union__PSAPI_WORKING_SET_BLOCK;
pub const struct__PSAPI_WORKING_SET_INFORMATION = extern struct {
    NumberOfEntries: win32.ULONG_PTR,
    WorkingSetInfo: [1]PSAPI_WORKING_SET_BLOCK,
};
pub const PSAPI_WORKING_SET_INFORMATION = struct__PSAPI_WORKING_SET_INFORMATION;
pub const PPSAPI_WORKING_SET_INFORMATION = [*c]struct__PSAPI_WORKING_SET_INFORMATION;
const struct_unnamed_260 = @Type(.Opaque); // C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\um\psapi.h:298:23: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_261 = @Type(.Opaque); // C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\um\psapi.h:313:23: warning: struct demoted to opaque type - has bitfield
const union_unnamed_259 = extern union {
    unnamed_0: struct_unnamed_260,
    Invalid: struct_unnamed_261,
};
pub const union__PSAPI_WORKING_SET_EX_BLOCK = extern union {
    Flags: win32.ULONG_PTR,
    unnamed_0: union_unnamed_259,
};
pub const PSAPI_WORKING_SET_EX_BLOCK = union__PSAPI_WORKING_SET_EX_BLOCK;
pub const PPSAPI_WORKING_SET_EX_BLOCK = [*c]union__PSAPI_WORKING_SET_EX_BLOCK;
pub const struct__PSAPI_WORKING_SET_EX_INFORMATION = extern struct {
    VirtualAddress: win32.PVOID,
    VirtualAttributes: PSAPI_WORKING_SET_EX_BLOCK,
};
pub const PSAPI_WORKING_SET_EX_INFORMATION = struct__PSAPI_WORKING_SET_EX_INFORMATION;
pub const PPSAPI_WORKING_SET_EX_INFORMATION = [*c]struct__PSAPI_WORKING_SET_EX_INFORMATION;

pub const LIST_MODULES_64BIT = 0x02;
pub const LIST_MODULES_DEFAULT = 0x0;
pub const LIST_MODULES_ALL = LIST_MODULES_32BIT | LIST_MODULES_64BIT;
pub const LIST_MODULES_32BIT = 0x01;
