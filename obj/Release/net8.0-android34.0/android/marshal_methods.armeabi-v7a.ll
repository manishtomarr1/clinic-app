; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [203 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [406 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 145
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 144
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 74
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 188
	i32 57725457, ; 4: it\Microsoft.Data.SqlClient.resources => 0x370d211 => 3
	i32 57727992, ; 5: ja\Microsoft.Data.SqlClient.resources => 0x370dbf8 => 4
	i32 66541672, ; 6: System.Diagnostics.StackTrace => 0x3f75868 => 127
	i32 67008169, ; 7: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 43
	i32 68219467, ; 8: System.Security.Cryptography.Primitives => 0x410f24b => 177
	i32 72070932, ; 9: Microsoft.Maui.Graphics.dll => 0x44bb714 => 72
	i32 117431740, ; 10: System.Runtime.InteropServices => 0x6ffddbc => 163
	i32 122350210, ; 11: System.Threading.Channels.dll => 0x74aea82 => 186
	i32 139659294, ; 12: ja/Microsoft.Data.SqlClient.resources.dll => 0x853081e => 4
	i32 142721839, ; 13: System.Net.WebHeaderCollection => 0x881c32f => 152
	i32 149972175, ; 14: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 177
	i32 165246403, ; 15: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 87
	i32 166535111, ; 16: ru/Microsoft.Data.SqlClient.resources.dll => 0x9ed1fc7 => 7
	i32 182336117, ; 17: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 105
	i32 195452805, ; 18: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 40
	i32 199333315, ; 19: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 41
	i32 205061960, ; 20: System.ComponentModel => 0xc38ff48 => 122
	i32 209399409, ; 21: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 85
	i32 230752869, ; 22: Microsoft.CSharp.dll => 0xdc10265 => 112
	i32 246610117, ; 23: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 160
	i32 264223668, ; 24: zh-Hans\Microsoft.Data.SqlClient.resources => 0xfbfbbb4 => 8
	i32 280992041, ; 25: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 12
	i32 317674968, ; 26: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 40
	i32 318968648, ; 27: Xamarin.AndroidX.Activity.dll => 0x13031348 => 82
	i32 330147069, ; 28: Microsoft.SqlServer.Server => 0x13ada4fd => 73
	i32 336156722, ; 29: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 25
	i32 342366114, ; 30: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 94
	i32 356389973, ; 31: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 24
	i32 367780167, ; 32: System.IO.Pipes => 0x15ebe147 => 138
	i32 374914964, ; 33: System.Transactions.Local => 0x1658bf94 => 191
	i32 375677976, ; 34: System.Net.ServicePoint.dll => 0x16646418 => 149
	i32 379916513, ; 35: System.Threading.Thread.dll => 0x16a510e1 => 188
	i32 385762202, ; 36: System.Memory.dll => 0x16fe439a => 141
	i32 392610295, ; 37: System.Threading.ThreadPool.dll => 0x1766c1f7 => 189
	i32 395744057, ; 38: _Microsoft.Android.Resource.Designer => 0x17969339 => 44
	i32 435591531, ; 39: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 36
	i32 442565967, ; 40: System.Collections => 0x1a61054f => 119
	i32 450948140, ; 41: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 93
	i32 451504562, ; 42: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 178
	i32 456227837, ; 43: System.Web.HttpUtility.dll => 0x1b317bfd => 192
	i32 459347974, ; 44: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 168
	i32 469710990, ; 45: System.dll => 0x1bff388e => 197
	i32 485463106, ; 46: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 61
	i32 498788369, ; 47: System.ObjectModel => 0x1dbae811 => 154
	i32 500358224, ; 48: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 23
	i32 503918385, ; 49: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 17
	i32 513247710, ; 50: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 58
	i32 539058512, ; 51: Microsoft.Extensions.Logging => 0x20216150 => 55
	i32 546455878, ; 52: System.Runtime.Serialization.Xml => 0x20924146 => 169
	i32 548916678, ; 53: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 49
	i32 577335427, ; 54: System.Security.Cryptography.Cng => 0x22697083 => 174
	i32 592146354, ; 55: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 31
	i32 597488923, ; 56: CommunityToolkit.Maui => 0x239cf51b => 47
	i32 613668793, ; 57: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 173
	i32 627609679, ; 58: Xamarin.AndroidX.CustomView => 0x2568904f => 91
	i32 627931235, ; 59: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 29
	i32 662205335, ; 60: System.Text.Encodings.Web.dll => 0x27787397 => 183
	i32 672442732, ; 61: System.Collections.Concurrent => 0x2814a96c => 115
	i32 683518922, ; 62: System.Net.Security => 0x28bdabca => 148
	i32 688181140, ; 63: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 11
	i32 690569205, ; 64: System.Xml.Linq.dll => 0x29293ff5 => 193
	i32 706645707, ; 65: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 26
	i32 709557578, ; 66: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 14
	i32 713568204, ; 67: MauiApp1.dll => 0x2a882fcc => 111
	i32 722857257, ; 68: System.Runtime.Loader.dll => 0x2b15ed29 => 164
	i32 723796036, ; 69: System.ClientModel.dll => 0x2b244044 => 75
	i32 759454413, ; 70: System.Net.Requests => 0x2d445acd => 147
	i32 762598435, ; 71: System.IO.Pipes.dll => 0x2d745423 => 138
	i32 775507847, ; 72: System.IO.Compression => 0x2e394f87 => 135
	i32 777317022, ; 73: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 35
	i32 789151979, ; 74: Microsoft.Extensions.Options => 0x2f0980eb => 57
	i32 804715423, ; 75: System.Data.Common => 0x2ff6fb9f => 124
	i32 823281589, ; 76: System.Private.Uri.dll => 0x311247b5 => 156
	i32 830298997, ; 77: System.IO.Compression.Brotli => 0x317d5b75 => 134
	i32 904024072, ; 78: System.ComponentModel.Primitives.dll => 0x35e25008 => 120
	i32 926902833, ; 79: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 38
	i32 955402788, ; 80: Newtonsoft.Json => 0x38f24a24 => 74
	i32 967690846, ; 81: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 94
	i32 975236339, ; 82: System.Diagnostics.Tracing => 0x3a20ecf3 => 130
	i32 975874589, ; 83: System.Xml.XDocument => 0x3a2aaa1d => 195
	i32 986514023, ; 84: System.Private.DataContractSerialization.dll => 0x3acd0267 => 155
	i32 992768348, ; 85: System.Collections.dll => 0x3b2c715c => 119
	i32 1012816738, ; 86: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 104
	i32 1019214401, ; 87: System.Drawing => 0x3cbffa41 => 132
	i32 1028951442, ; 88: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 54
	i32 1029334545, ; 89: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 13
	i32 1035644815, ; 90: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 83
	i32 1036536393, ; 91: System.Drawing.Primitives.dll => 0x3dc84a49 => 131
	i32 1044663988, ; 92: System.Linq.Expressions.dll => 0x3e444eb4 => 139
	i32 1048439329, ; 93: de/Microsoft.Data.SqlClient.resources.dll => 0x3e7dea21 => 0
	i32 1052210849, ; 94: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 96
	i32 1062017875, ; 95: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 60
	i32 1082857460, ; 96: System.ComponentModel.TypeConverter => 0x408b17f4 => 121
	i32 1084122840, ; 97: Xamarin.Kotlin.StdLib => 0x409e66d8 => 109
	i32 1089913930, ; 98: System.Diagnostics.EventLog.dll => 0x40f6c44a => 77
	i32 1098259244, ; 99: System => 0x41761b2c => 197
	i32 1118262833, ; 100: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 26
	i32 1138436374, ; 101: Microsoft.Data.SqlClient.dll => 0x43db2916 => 50
	i32 1168523401, ; 102: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 32
	i32 1178241025, ; 103: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 101
	i32 1203215381, ; 104: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 30
	i32 1208641965, ; 105: System.Diagnostics.Process => 0x480a69ad => 126
	i32 1234928153, ; 106: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 28
	i32 1260983243, ; 107: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 12
	i32 1293217323, ; 108: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 92
	i32 1309188875, ; 109: System.Private.DataContractSerialization => 0x4e08a30b => 155
	i32 1324164729, ; 110: System.Linq => 0x4eed2679 => 140
	i32 1335329327, ; 111: System.Runtime.Serialization.Json.dll => 0x4f97822f => 167
	i32 1373134921, ; 112: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 42
	i32 1376866003, ; 113: Xamarin.AndroidX.SavedState => 0x52114ed3 => 104
	i32 1406073936, ; 114: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 88
	i32 1408764838, ; 115: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 166
	i32 1430672901, ; 116: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 10
	i32 1452070440, ; 117: System.Formats.Asn1.dll => 0x568cd628 => 133
	i32 1458022317, ; 118: System.Net.Security.dll => 0x56e7a7ad => 148
	i32 1460893475, ; 119: System.IdentityModel.Tokens.Jwt => 0x57137723 => 78
	i32 1461004990, ; 120: es\Microsoft.Maui.Controls.resources => 0x57152abe => 16
	i32 1461234159, ; 121: System.Collections.Immutable.dll => 0x5718a9ef => 116
	i32 1462112819, ; 122: System.IO.Compression.dll => 0x57261233 => 135
	i32 1469204771, ; 123: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 84
	i32 1470490898, ; 124: Microsoft.Extensions.Primitives => 0x57a5e912 => 58
	i32 1479771757, ; 125: System.Collections.Immutable => 0x5833866d => 116
	i32 1480492111, ; 126: System.IO.Compression.Brotli.dll => 0x583e844f => 134
	i32 1487239319, ; 127: Microsoft.Win32.Primitives => 0x58a57897 => 113
	i32 1493001747, ; 128: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 20
	i32 1498168481, ; 129: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 62
	i32 1514721132, ; 130: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 15
	i32 1536373174, ; 131: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 128
	i32 1543031311, ; 132: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 185
	i32 1551623176, ; 133: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 35
	i32 1565310744, ; 134: System.Runtime.Caching => 0x5d4cbf18 => 80
	i32 1573704789, ; 135: System.Runtime.Serialization.Json => 0x5dccd455 => 167
	i32 1582305585, ; 136: Azure.Identity => 0x5e501131 => 46
	i32 1596263029, ; 137: zh-Hant\Microsoft.Data.SqlClient.resources => 0x5f250a75 => 9
	i32 1604827217, ; 138: System.Net.WebClient => 0x5fa7b851 => 151
	i32 1622152042, ; 139: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 98
	i32 1624863272, ; 140: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 107
	i32 1628113371, ; 141: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 65
	i32 1634654947, ; 142: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 48
	i32 1636350590, ; 143: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 90
	i32 1639515021, ; 144: System.Net.Http.dll => 0x61b9038d => 142
	i32 1639986890, ; 145: System.Text.RegularExpressions => 0x61c036ca => 185
	i32 1657153582, ; 146: System.Runtime => 0x62c6282e => 170
	i32 1658251792, ; 147: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 108
	i32 1677501392, ; 148: System.Net.Primitives.dll => 0x63fca3d0 => 146
	i32 1679769178, ; 149: System.Security.Cryptography => 0x641f3e5a => 179
	i32 1696967625, ; 150: System.Security.Cryptography.Csp => 0x6525abc9 => 175
	i32 1729485958, ; 151: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 86
	i32 1736233607, ; 152: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 33
	i32 1743415430, ; 153: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 11
	i32 1744735666, ; 154: System.Transactions.Local.dll => 0x67fe8db2 => 191
	i32 1750313021, ; 155: Microsoft.Win32.Primitives.dll => 0x6853a83d => 113
	i32 1763938596, ; 156: System.Diagnostics.TraceSource.dll => 0x69239124 => 129
	i32 1766324549, ; 157: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 105
	i32 1770582343, ; 158: Microsoft.Extensions.Logging.dll => 0x6988f147 => 55
	i32 1780572499, ; 159: Mono.Android.Runtime.dll => 0x6a216153 => 201
	i32 1782862114, ; 160: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 27
	i32 1788241197, ; 161: Xamarin.AndroidX.Fragment => 0x6a96652d => 93
	i32 1793755602, ; 162: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 19
	i32 1794500907, ; 163: Microsoft.Identity.Client.dll => 0x6af5e92b => 59
	i32 1796167890, ; 164: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 49
	i32 1808609942, ; 165: Xamarin.AndroidX.Loader => 0x6bcd3296 => 98
	i32 1813058853, ; 166: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 109
	i32 1813201214, ; 167: Xamarin.Google.Android.Material => 0x6c13413e => 108
	i32 1818569960, ; 168: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 102
	i32 1824175904, ; 169: System.Text.Encoding.Extensions => 0x6cbab720 => 182
	i32 1824722060, ; 170: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 166
	i32 1828688058, ; 171: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 56
	i32 1842015223, ; 172: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 39
	i32 1853025655, ; 173: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 36
	i32 1858542181, ; 174: System.Linq.Expressions => 0x6ec71a65 => 139
	i32 1870277092, ; 175: System.Reflection.Primitives => 0x6f7a29e4 => 161
	i32 1871986876, ; 176: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 65
	i32 1875935024, ; 177: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 18
	i32 1910275211, ; 178: System.Collections.NonGeneric.dll => 0x71dc7c8b => 117
	i32 1939592360, ; 179: System.Private.Xml.Linq => 0x739bd4a8 => 157
	i32 1968388702, ; 180: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 51
	i32 1986222447, ; 181: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 66
	i32 2003115576, ; 182: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 15
	i32 2011961780, ; 183: System.Buffers.dll => 0x77ec19b4 => 114
	i32 2019465201, ; 184: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 96
	i32 2025202353, ; 185: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 10
	i32 2040764568, ; 186: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 60
	i32 2045470958, ; 187: System.Private.Xml => 0x79eb68ee => 158
	i32 2055257422, ; 188: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 95
	i32 2066184531, ; 189: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 14
	i32 2070888862, ; 190: System.Diagnostics.TraceSource => 0x7b6f419e => 129
	i32 2079903147, ; 191: System.Runtime.dll => 0x7bf8cdab => 170
	i32 2090596640, ; 192: System.Numerics.Vectors => 0x7c9bf920 => 153
	i32 2127167465, ; 193: System.Console => 0x7ec9ffe9 => 123
	i32 2142473426, ; 194: System.Collections.Specialized => 0x7fb38cd2 => 118
	i32 2143790110, ; 195: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 196
	i32 2159891885, ; 196: Microsoft.Maui => 0x80bd55ad => 70
	i32 2169148018, ; 197: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 22
	i32 2181898931, ; 198: Microsoft.Extensions.Options.dll => 0x820d22b3 => 57
	i32 2192057212, ; 199: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 56
	i32 2193016926, ; 200: System.ObjectModel.dll => 0x82b6c85e => 154
	i32 2201107256, ; 201: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 110
	i32 2201231467, ; 202: System.Net.Http => 0x8334206b => 142
	i32 2207618523, ; 203: it\Microsoft.Maui.Controls.resources => 0x839595db => 24
	i32 2228745826, ; 204: pt-BR\Microsoft.Data.SqlClient.resources => 0x84d7f662 => 6
	i32 2253551641, ; 205: Microsoft.IdentityModel.Protocols => 0x86527819 => 64
	i32 2265110946, ; 206: System.Security.AccessControl.dll => 0x8702d9a2 => 171
	i32 2266799131, ; 207: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 52
	i32 2270573516, ; 208: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 18
	i32 2279755925, ; 209: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 103
	i32 2295906218, ; 210: System.Net.Sockets => 0x88d8bfaa => 150
	i32 2298471582, ; 211: System.Net.Mail => 0x88ffe49e => 143
	i32 2303942373, ; 212: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 28
	i32 2305521784, ; 213: System.Private.CoreLib.dll => 0x896b7878 => 199
	i32 2309278602, ; 214: ko\Microsoft.Data.SqlClient.resources => 0x89a4cb8a => 5
	i32 2340441535, ; 215: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 162
	i32 2353062107, ; 216: System.Net.Primitives => 0x8c40e0db => 146
	i32 2368005991, ; 217: System.Xml.ReaderWriter.dll => 0x8d24e767 => 194
	i32 2369706906, ; 218: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 63
	i32 2371007202, ; 219: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 51
	i32 2378619854, ; 220: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 175
	i32 2383496789, ; 221: System.Security.Principal.Windows.dll => 0x8e114655 => 180
	i32 2395872292, ; 222: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 23
	i32 2401565422, ; 223: System.Web.HttpUtility => 0x8f24faee => 192
	i32 2427813419, ; 224: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 20
	i32 2435356389, ; 225: System.Console.dll => 0x912896e5 => 123
	i32 2458678730, ; 226: System.Net.Sockets.dll => 0x928c75ca => 150
	i32 2471841756, ; 227: netstandard.dll => 0x93554fdc => 198
	i32 2475788418, ; 228: Java.Interop.dll => 0x93918882 => 200
	i32 2480646305, ; 229: Microsoft.Maui.Controls => 0x93dba8a1 => 68
	i32 2484371297, ; 230: System.Net.ServicePoint => 0x94147f61 => 149
	i32 2509217888, ; 231: System.Diagnostics.EventLog => 0x958fa060 => 77
	i32 2538310050, ; 232: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 160
	i32 2550873716, ; 233: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 21
	i32 2562349572, ; 234: Microsoft.CSharp => 0x98ba5a04 => 112
	i32 2570120770, ; 235: System.Text.Encodings.Web => 0x9930ee42 => 183
	i32 2585220780, ; 236: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 182
	i32 2589602615, ; 237: System.Threading.ThreadPool => 0x9a5a3337 => 189
	i32 2593496499, ; 238: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 30
	i32 2605712449, ; 239: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 110
	i32 2617129537, ; 240: System.Private.Xml.dll => 0x9bfe3a41 => 158
	i32 2620871830, ; 241: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 90
	i32 2626831493, ; 242: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 25
	i32 2627185994, ; 243: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 128
	i32 2628210652, ; 244: System.Memory.Data => 0x9ca74fdc => 79
	i32 2640290731, ; 245: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 63
	i32 2640706905, ; 246: Azure.Core => 0x9d65fd59 => 45
	i32 2660759594, ; 247: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 81
	i32 2663698177, ; 248: System.Runtime.Loader => 0x9ec4cf01 => 164
	i32 2664396074, ; 249: System.Xml.XDocument.dll => 0x9ecf752a => 195
	i32 2665622720, ; 250: System.Drawing.Primitives => 0x9ee22cc0 => 131
	i32 2676780864, ; 251: System.Data.Common.dll => 0x9f8c6f40 => 124
	i32 2677098746, ; 252: Azure.Identity.dll => 0x9f9148fa => 46
	i32 2686887180, ; 253: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 169
	i32 2717744543, ; 254: System.Security.Claims => 0xa1fd7d9f => 172
	i32 2719963679, ; 255: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 174
	i32 2724373263, ; 256: System.Runtime.Numerics.dll => 0xa262a30f => 165
	i32 2732626843, ; 257: Xamarin.AndroidX.Activity => 0xa2e0939b => 82
	i32 2735172069, ; 258: System.Threading.Channels => 0xa30769e5 => 186
	i32 2737747696, ; 259: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 84
	i32 2740051746, ; 260: Microsoft.Identity.Client => 0xa351df22 => 59
	i32 2752995522, ; 261: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 31
	i32 2755098380, ; 262: Microsoft.SqlServer.Server.dll => 0xa437770c => 73
	i32 2758225723, ; 263: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 69
	i32 2764765095, ; 264: Microsoft.Maui.dll => 0xa4caf7a7 => 70
	i32 2765824710, ; 265: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 181
	i32 2778768386, ; 266: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 106
	i32 2785988530, ; 267: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 37
	i32 2801831435, ; 268: Microsoft.Maui.Graphics => 0xa7008e0b => 72
	i32 2804509662, ; 269: es/Microsoft.Data.SqlClient.resources.dll => 0xa7296bde => 1
	i32 2806116107, ; 270: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 16
	i32 2810250172, ; 271: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 88
	i32 2831556043, ; 272: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 29
	i32 2841937114, ; 273: it/Microsoft.Data.SqlClient.resources.dll => 0xa96484da => 3
	i32 2853208004, ; 274: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 106
	i32 2861189240, ; 275: Microsoft.Maui.Essentials => 0xaa8a4878 => 71
	i32 2867946736, ; 276: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 81
	i32 2868488919, ; 277: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 48
	i32 2909740682, ; 278: System.Private.CoreLib => 0xad6f1e8a => 199
	i32 2916838712, ; 279: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 107
	i32 2919462931, ; 280: System.Numerics.Vectors.dll => 0xae037813 => 153
	i32 2940926066, ; 281: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 127
	i32 2944313911, ; 282: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 76
	i32 2959614098, ; 283: System.ComponentModel.dll => 0xb0682092 => 122
	i32 2968338931, ; 284: System.Security.Principal.Windows => 0xb0ed41f3 => 180
	i32 2972252294, ; 285: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 173
	i32 2978675010, ; 286: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 92
	i32 3012788804, ; 287: System.Configuration.ConfigurationManager => 0xb3938244 => 76
	i32 3017953105, ; 288: MauiApp1 => 0xb3e24f51 => 111
	i32 3023511517, ; 289: ru\Microsoft.Data.SqlClient.resources => 0xb4371fdd => 7
	i32 3033605958, ; 290: System.Memory.Data.dll => 0xb4d12746 => 79
	i32 3038032645, ; 291: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 44
	i32 3057625584, ; 292: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 99
	i32 3059408633, ; 293: Mono.Android.Runtime => 0xb65adef9 => 201
	i32 3059793426, ; 294: System.ComponentModel.Primitives => 0xb660be12 => 120
	i32 3077302341, ; 295: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 22
	i32 3084678329, ; 296: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 66
	i32 3090735792, ; 297: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 178
	i32 3099732863, ; 298: System.Security.Claims.dll => 0xb8c22b7f => 172
	i32 3103600923, ; 299: System.Formats.Asn1 => 0xb8fd311b => 133
	i32 3121463068, ; 300: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 136
	i32 3124832203, ; 301: System.Threading.Tasks.Extensions => 0xba4127cb => 187
	i32 3132293585, ; 302: System.Security.AccessControl => 0xbab301d1 => 171
	i32 3147165239, ; 303: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 130
	i32 3158628304, ; 304: zh-Hant/Microsoft.Data.SqlClient.resources.dll => 0xbc44d7d0 => 9
	i32 3159123045, ; 305: System.Reflection.Primitives.dll => 0xbc4c6465 => 161
	i32 3178803400, ; 306: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 100
	i32 3220365878, ; 307: System.Threading => 0xbff2e236 => 190
	i32 3258312781, ; 308: Xamarin.AndroidX.CardView => 0xc235e84d => 86
	i32 3265893370, ; 309: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 187
	i32 3268887220, ; 310: fr/Microsoft.Data.SqlClient.resources.dll => 0xc2d742b4 => 2
	i32 3276600297, ; 311: pt-BR/Microsoft.Data.SqlClient.resources.dll => 0xc34cf3e9 => 6
	i32 3290767353, ; 312: System.Security.Cryptography.Encoding => 0xc4251ff9 => 176
	i32 3305363605, ; 313: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 17
	i32 3312457198, ; 314: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 62
	i32 3316684772, ; 315: System.Net.Requests.dll => 0xc5b097e4 => 147
	i32 3317135071, ; 316: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 91
	i32 3343947874, ; 317: fr\Microsoft.Data.SqlClient.resources => 0xc7509862 => 2
	i32 3346324047, ; 318: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 101
	i32 3357674450, ; 319: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 34
	i32 3358260929, ; 320: System.Text.Json => 0xc82afec1 => 184
	i32 3362522851, ; 321: Xamarin.AndroidX.Core => 0xc86c06e3 => 89
	i32 3366347497, ; 322: Java.Interop => 0xc8a662e9 => 200
	i32 3374879918, ; 323: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 64
	i32 3374999561, ; 324: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 103
	i32 3381016424, ; 325: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 13
	i32 3428513518, ; 326: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 53
	i32 3430777524, ; 327: netstandard => 0xcc7d82b4 => 198
	i32 3452344032, ; 328: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 67
	i32 3463511458, ; 329: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 21
	i32 3471940407, ; 330: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 121
	i32 3476120550, ; 331: Mono.Android => 0xcf3163e6 => 202
	i32 3479583265, ; 332: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 34
	i32 3484440000, ; 333: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 33
	i32 3485117614, ; 334: System.Text.Json.dll => 0xcfbaacae => 184
	i32 3509114376, ; 335: System.Xml.Linq => 0xd128d608 => 193
	i32 3545306353, ; 336: Microsoft.Data.SqlClient => 0xd35114f1 => 50
	i32 3555084973, ; 337: de\Microsoft.Data.SqlClient.resources => 0xd3e64aad => 0
	i32 3558648585, ; 338: System.ClientModel => 0xd41cab09 => 75
	i32 3561949811, ; 339: Azure.Core.dll => 0xd44f0a73 => 45
	i32 3570554715, ; 340: System.IO.FileSystem.AccessControl => 0xd4d2575b => 136
	i32 3570608287, ; 341: System.Runtime.Caching.dll => 0xd4d3289f => 80
	i32 3580758918, ; 342: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 41
	i32 3608519521, ; 343: System.Linq.dll => 0xd715a361 => 140
	i32 3624195450, ; 344: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 162
	i32 3641597786, ; 345: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 95
	i32 3643446276, ; 346: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 38
	i32 3643854240, ; 347: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 100
	i32 3657292374, ; 348: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 52
	i32 3660523487, ; 349: System.Net.NetworkInformation => 0xda2f27df => 145
	i32 3672681054, ; 350: Mono.Android.dll => 0xdae8aa5e => 202
	i32 3682565725, ; 351: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 85
	i32 3697841164, ; 352: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 43
	i32 3700591436, ; 353: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 61
	i32 3724971120, ; 354: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 99
	i32 3732100267, ; 355: System.Net.NameResolution => 0xde7354ab => 144
	i32 3748608112, ; 356: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 125
	i32 3786282454, ; 357: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 87
	i32 3792276235, ; 358: System.Collections.NonGeneric => 0xe2098b0b => 117
	i32 3800979733, ; 359: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 67
	i32 3802395368, ; 360: System.Collections.Specialized.dll => 0xe2a3f2e8 => 118
	i32 3803019198, ; 361: zh-Hans/Microsoft.Data.SqlClient.resources.dll => 0xe2ad77be => 8
	i32 3817368567, ; 362: CommunityToolkit.Maui.dll => 0xe3886bf7 => 47
	i32 3823082795, ; 363: System.Security.Cryptography.dll => 0xe3df9d2b => 179
	i32 3841636137, ; 364: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 54
	i32 3844307129, ; 365: System.Net.Mail.dll => 0xe52378b9 => 143
	i32 3848348906, ; 366: es\Microsoft.Data.SqlClient.resources => 0xe56124ea => 1
	i32 3849253459, ; 367: System.Runtime.InteropServices.dll => 0xe56ef253 => 163
	i32 3875112723, ; 368: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 176
	i32 3885497537, ; 369: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 152
	i32 3889960447, ; 370: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 42
	i32 3896106733, ; 371: System.Collections.Concurrent.dll => 0xe839deed => 115
	i32 3896760992, ; 372: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 89
	i32 3928044579, ; 373: System.Xml.ReaderWriter => 0xea213423 => 194
	i32 3931092270, ; 374: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 102
	i32 3953953790, ; 375: System.Text.Encoding.CodePages => 0xebac8bfe => 181
	i32 3955647286, ; 376: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 83
	i32 3980434154, ; 377: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 37
	i32 3987592930, ; 378: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 19
	i32 4003436829, ; 379: System.Diagnostics.Process.dll => 0xee9f991d => 126
	i32 4025784931, ; 380: System.Memory => 0xeff49a63 => 141
	i32 4046471985, ; 381: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 69
	i32 4054681211, ; 382: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 159
	i32 4068434129, ; 383: System.Private.Xml.Linq.dll => 0xf27f60d1 => 157
	i32 4073602200, ; 384: System.Threading.dll => 0xf2ce3c98 => 190
	i32 4094352644, ; 385: Microsoft.Maui.Essentials.dll => 0xf40add04 => 71
	i32 4099507663, ; 386: System.Drawing.dll => 0xf45985cf => 132
	i32 4100113165, ; 387: System.Private.Uri => 0xf462c30d => 156
	i32 4102112229, ; 388: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 32
	i32 4125707920, ; 389: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 27
	i32 4126470640, ; 390: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 53
	i32 4127667938, ; 391: System.IO.FileSystem.Watcher => 0xf60736e2 => 137
	i32 4147896353, ; 392: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 159
	i32 4150914736, ; 393: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 39
	i32 4159265925, ; 394: System.Xml.XmlSerializer => 0xf7e95c85 => 196
	i32 4164802419, ; 395: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 137
	i32 4181436372, ; 396: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 168
	i32 4182413190, ; 397: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 97
	i32 4196529839, ; 398: System.Net.WebClient.dll => 0xfa21f6af => 151
	i32 4213026141, ; 399: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 125
	i32 4257443520, ; 400: ko/Microsoft.Data.SqlClient.resources.dll => 0xfdc36ec0 => 5
	i32 4260525087, ; 401: System.Buffers => 0xfdf2741f => 114
	i32 4263231520, ; 402: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 78
	i32 4271975918, ; 403: Microsoft.Maui.Controls.dll => 0xfea12dee => 68
	i32 4274976490, ; 404: System.Runtime.Numerics => 0xfecef6ea => 165
	i32 4292120959 ; 405: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 97
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [406 x i32] [
	i32 145, ; 0
	i32 144, ; 1
	i32 74, ; 2
	i32 188, ; 3
	i32 3, ; 4
	i32 4, ; 5
	i32 127, ; 6
	i32 43, ; 7
	i32 177, ; 8
	i32 72, ; 9
	i32 163, ; 10
	i32 186, ; 11
	i32 4, ; 12
	i32 152, ; 13
	i32 177, ; 14
	i32 87, ; 15
	i32 7, ; 16
	i32 105, ; 17
	i32 40, ; 18
	i32 41, ; 19
	i32 122, ; 20
	i32 85, ; 21
	i32 112, ; 22
	i32 160, ; 23
	i32 8, ; 24
	i32 12, ; 25
	i32 40, ; 26
	i32 82, ; 27
	i32 73, ; 28
	i32 25, ; 29
	i32 94, ; 30
	i32 24, ; 31
	i32 138, ; 32
	i32 191, ; 33
	i32 149, ; 34
	i32 188, ; 35
	i32 141, ; 36
	i32 189, ; 37
	i32 44, ; 38
	i32 36, ; 39
	i32 119, ; 40
	i32 93, ; 41
	i32 178, ; 42
	i32 192, ; 43
	i32 168, ; 44
	i32 197, ; 45
	i32 61, ; 46
	i32 154, ; 47
	i32 23, ; 48
	i32 17, ; 49
	i32 58, ; 50
	i32 55, ; 51
	i32 169, ; 52
	i32 49, ; 53
	i32 174, ; 54
	i32 31, ; 55
	i32 47, ; 56
	i32 173, ; 57
	i32 91, ; 58
	i32 29, ; 59
	i32 183, ; 60
	i32 115, ; 61
	i32 148, ; 62
	i32 11, ; 63
	i32 193, ; 64
	i32 26, ; 65
	i32 14, ; 66
	i32 111, ; 67
	i32 164, ; 68
	i32 75, ; 69
	i32 147, ; 70
	i32 138, ; 71
	i32 135, ; 72
	i32 35, ; 73
	i32 57, ; 74
	i32 124, ; 75
	i32 156, ; 76
	i32 134, ; 77
	i32 120, ; 78
	i32 38, ; 79
	i32 74, ; 80
	i32 94, ; 81
	i32 130, ; 82
	i32 195, ; 83
	i32 155, ; 84
	i32 119, ; 85
	i32 104, ; 86
	i32 132, ; 87
	i32 54, ; 88
	i32 13, ; 89
	i32 83, ; 90
	i32 131, ; 91
	i32 139, ; 92
	i32 0, ; 93
	i32 96, ; 94
	i32 60, ; 95
	i32 121, ; 96
	i32 109, ; 97
	i32 77, ; 98
	i32 197, ; 99
	i32 26, ; 100
	i32 50, ; 101
	i32 32, ; 102
	i32 101, ; 103
	i32 30, ; 104
	i32 126, ; 105
	i32 28, ; 106
	i32 12, ; 107
	i32 92, ; 108
	i32 155, ; 109
	i32 140, ; 110
	i32 167, ; 111
	i32 42, ; 112
	i32 104, ; 113
	i32 88, ; 114
	i32 166, ; 115
	i32 10, ; 116
	i32 133, ; 117
	i32 148, ; 118
	i32 78, ; 119
	i32 16, ; 120
	i32 116, ; 121
	i32 135, ; 122
	i32 84, ; 123
	i32 58, ; 124
	i32 116, ; 125
	i32 134, ; 126
	i32 113, ; 127
	i32 20, ; 128
	i32 62, ; 129
	i32 15, ; 130
	i32 128, ; 131
	i32 185, ; 132
	i32 35, ; 133
	i32 80, ; 134
	i32 167, ; 135
	i32 46, ; 136
	i32 9, ; 137
	i32 151, ; 138
	i32 98, ; 139
	i32 107, ; 140
	i32 65, ; 141
	i32 48, ; 142
	i32 90, ; 143
	i32 142, ; 144
	i32 185, ; 145
	i32 170, ; 146
	i32 108, ; 147
	i32 146, ; 148
	i32 179, ; 149
	i32 175, ; 150
	i32 86, ; 151
	i32 33, ; 152
	i32 11, ; 153
	i32 191, ; 154
	i32 113, ; 155
	i32 129, ; 156
	i32 105, ; 157
	i32 55, ; 158
	i32 201, ; 159
	i32 27, ; 160
	i32 93, ; 161
	i32 19, ; 162
	i32 59, ; 163
	i32 49, ; 164
	i32 98, ; 165
	i32 109, ; 166
	i32 108, ; 167
	i32 102, ; 168
	i32 182, ; 169
	i32 166, ; 170
	i32 56, ; 171
	i32 39, ; 172
	i32 36, ; 173
	i32 139, ; 174
	i32 161, ; 175
	i32 65, ; 176
	i32 18, ; 177
	i32 117, ; 178
	i32 157, ; 179
	i32 51, ; 180
	i32 66, ; 181
	i32 15, ; 182
	i32 114, ; 183
	i32 96, ; 184
	i32 10, ; 185
	i32 60, ; 186
	i32 158, ; 187
	i32 95, ; 188
	i32 14, ; 189
	i32 129, ; 190
	i32 170, ; 191
	i32 153, ; 192
	i32 123, ; 193
	i32 118, ; 194
	i32 196, ; 195
	i32 70, ; 196
	i32 22, ; 197
	i32 57, ; 198
	i32 56, ; 199
	i32 154, ; 200
	i32 110, ; 201
	i32 142, ; 202
	i32 24, ; 203
	i32 6, ; 204
	i32 64, ; 205
	i32 171, ; 206
	i32 52, ; 207
	i32 18, ; 208
	i32 103, ; 209
	i32 150, ; 210
	i32 143, ; 211
	i32 28, ; 212
	i32 199, ; 213
	i32 5, ; 214
	i32 162, ; 215
	i32 146, ; 216
	i32 194, ; 217
	i32 63, ; 218
	i32 51, ; 219
	i32 175, ; 220
	i32 180, ; 221
	i32 23, ; 222
	i32 192, ; 223
	i32 20, ; 224
	i32 123, ; 225
	i32 150, ; 226
	i32 198, ; 227
	i32 200, ; 228
	i32 68, ; 229
	i32 149, ; 230
	i32 77, ; 231
	i32 160, ; 232
	i32 21, ; 233
	i32 112, ; 234
	i32 183, ; 235
	i32 182, ; 236
	i32 189, ; 237
	i32 30, ; 238
	i32 110, ; 239
	i32 158, ; 240
	i32 90, ; 241
	i32 25, ; 242
	i32 128, ; 243
	i32 79, ; 244
	i32 63, ; 245
	i32 45, ; 246
	i32 81, ; 247
	i32 164, ; 248
	i32 195, ; 249
	i32 131, ; 250
	i32 124, ; 251
	i32 46, ; 252
	i32 169, ; 253
	i32 172, ; 254
	i32 174, ; 255
	i32 165, ; 256
	i32 82, ; 257
	i32 186, ; 258
	i32 84, ; 259
	i32 59, ; 260
	i32 31, ; 261
	i32 73, ; 262
	i32 69, ; 263
	i32 70, ; 264
	i32 181, ; 265
	i32 106, ; 266
	i32 37, ; 267
	i32 72, ; 268
	i32 1, ; 269
	i32 16, ; 270
	i32 88, ; 271
	i32 29, ; 272
	i32 3, ; 273
	i32 106, ; 274
	i32 71, ; 275
	i32 81, ; 276
	i32 48, ; 277
	i32 199, ; 278
	i32 107, ; 279
	i32 153, ; 280
	i32 127, ; 281
	i32 76, ; 282
	i32 122, ; 283
	i32 180, ; 284
	i32 173, ; 285
	i32 92, ; 286
	i32 76, ; 287
	i32 111, ; 288
	i32 7, ; 289
	i32 79, ; 290
	i32 44, ; 291
	i32 99, ; 292
	i32 201, ; 293
	i32 120, ; 294
	i32 22, ; 295
	i32 66, ; 296
	i32 178, ; 297
	i32 172, ; 298
	i32 133, ; 299
	i32 136, ; 300
	i32 187, ; 301
	i32 171, ; 302
	i32 130, ; 303
	i32 9, ; 304
	i32 161, ; 305
	i32 100, ; 306
	i32 190, ; 307
	i32 86, ; 308
	i32 187, ; 309
	i32 2, ; 310
	i32 6, ; 311
	i32 176, ; 312
	i32 17, ; 313
	i32 62, ; 314
	i32 147, ; 315
	i32 91, ; 316
	i32 2, ; 317
	i32 101, ; 318
	i32 34, ; 319
	i32 184, ; 320
	i32 89, ; 321
	i32 200, ; 322
	i32 64, ; 323
	i32 103, ; 324
	i32 13, ; 325
	i32 53, ; 326
	i32 198, ; 327
	i32 67, ; 328
	i32 21, ; 329
	i32 121, ; 330
	i32 202, ; 331
	i32 34, ; 332
	i32 33, ; 333
	i32 184, ; 334
	i32 193, ; 335
	i32 50, ; 336
	i32 0, ; 337
	i32 75, ; 338
	i32 45, ; 339
	i32 136, ; 340
	i32 80, ; 341
	i32 41, ; 342
	i32 140, ; 343
	i32 162, ; 344
	i32 95, ; 345
	i32 38, ; 346
	i32 100, ; 347
	i32 52, ; 348
	i32 145, ; 349
	i32 202, ; 350
	i32 85, ; 351
	i32 43, ; 352
	i32 61, ; 353
	i32 99, ; 354
	i32 144, ; 355
	i32 125, ; 356
	i32 87, ; 357
	i32 117, ; 358
	i32 67, ; 359
	i32 118, ; 360
	i32 8, ; 361
	i32 47, ; 362
	i32 179, ; 363
	i32 54, ; 364
	i32 143, ; 365
	i32 1, ; 366
	i32 163, ; 367
	i32 176, ; 368
	i32 152, ; 369
	i32 42, ; 370
	i32 115, ; 371
	i32 89, ; 372
	i32 194, ; 373
	i32 102, ; 374
	i32 181, ; 375
	i32 83, ; 376
	i32 37, ; 377
	i32 19, ; 378
	i32 126, ; 379
	i32 141, ; 380
	i32 69, ; 381
	i32 159, ; 382
	i32 157, ; 383
	i32 190, ; 384
	i32 71, ; 385
	i32 132, ; 386
	i32 156, ; 387
	i32 32, ; 388
	i32 27, ; 389
	i32 53, ; 390
	i32 137, ; 391
	i32 159, ; 392
	i32 39, ; 393
	i32 196, ; 394
	i32 137, ; 395
	i32 168, ; 396
	i32 97, ; 397
	i32 151, ; 398
	i32 125, ; 399
	i32 5, ; 400
	i32 114, ; 401
	i32 78, ; 402
	i32 68, ; 403
	i32 165, ; 404
	i32 97 ; 405
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
