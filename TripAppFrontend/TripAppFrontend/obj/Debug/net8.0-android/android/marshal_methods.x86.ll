; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [320 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [634 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 240
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 274
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 282
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 198
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 9: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 291
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 315
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 195
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 16: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 299
	i32 101534019, ; 17: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 258
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 258
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 278
	i32 136584136, ; 22: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 314
	i32 140062828, ; 23: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 307
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 214
	i32 176265551, ; 28: System.ServiceProcess => 0xa81994f => 132
	i32 176714968, ; 29: Microsoft.AspNetCore.WebUtilities.dll => 0xa8874d8 => 178
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 260
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 32: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 33: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 212
	i32 220171995, ; 34: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 234
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 39: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 217
	i32 276479776, ; 41: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 236
	i32 280482487, ; 43: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 233
	i32 291076382, ; 44: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 45: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 46: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 312
	i32 318968648, ; 47: Xamarin.AndroidX.Activity.dll => 0x13031348 => 203
	i32 321597661, ; 48: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 49: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 290
	i32 342366114, ; 50: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 235
	i32 360082299, ; 51: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 52: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 53: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 54: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 55: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 56: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 57: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 58: _Microsoft.Android.Resource.Designer => 0x17969339 => 316
	i32 403441872, ; 59: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 60: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 310
	i32 441335492, ; 61: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 218
	i32 442565967, ; 62: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 63: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 231
	i32 451504562, ; 64: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 68: System.dll => 0x1bff388e => 164
	i32 476646585, ; 69: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 233
	i32 486930444, ; 70: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 246
	i32 489220957, ; 71: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 288
	i32 498788369, ; 72: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 73: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 189
	i32 526420162, ; 74: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 75: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 278
	i32 530272170, ; 76: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 77: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 309
	i32 539058512, ; 78: Microsoft.Extensions.Logging => 0x20216150 => 184
	i32 540030774, ; 79: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 80: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 81: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 82: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 83: Jsr305Binding => 0x213954e7 => 271
	i32 569601784, ; 84: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 269
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 601371474, ; 86: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 87: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 88: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 89: Xamarin.AndroidX.CustomView => 0x2568904f => 223
	i32 627931235, ; 90: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 301
	i32 639843206, ; 91: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 229
	i32 643868501, ; 92: System.Net => 0x2660a755 => 81
	i32 662205335, ; 93: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 94: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 265
	i32 666292255, ; 95: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 210
	i32 672442732, ; 96: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 97: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 98: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 99: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 280
	i32 693804605, ; 100: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 101: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 102: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 275
	i32 700358131, ; 103: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 104: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 279
	i32 722857257, ; 105: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 106: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 107: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 108: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 200
	i32 759454413, ; 109: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 110: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 111: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 112: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 307
	i32 789151979, ; 113: Microsoft.Extensions.Options => 0x2f0980eb => 188
	i32 790371945, ; 114: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 224
	i32 804715423, ; 115: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 116: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 238
	i32 823281589, ; 117: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 118: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 119: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 120: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 121: Xamarin.AndroidX.Print => 0x3246f6cd => 251
	i32 869139383, ; 122: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 292
	i32 873119928, ; 123: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 124: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 125: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 126: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 306
	i32 904024072, ; 127: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 128: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 129: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 303
	i32 928116545, ; 130: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 274
	i32 952186615, ; 131: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 132: Newtonsoft.Json => 0x38f24a24 => 198
	i32 956575887, ; 133: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 279
	i32 961460050, ; 134: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 296
	i32 966729478, ; 135: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 272
	i32 967690846, ; 136: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 235
	i32 975236339, ; 137: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 138: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 139: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 140: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 141: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 305
	i32 992768348, ; 142: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 143: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 144: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 145: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 255
	i32 1019214401, ; 146: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 147: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 182
	i32 1031528504, ; 148: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 273
	i32 1035644815, ; 149: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 208
	i32 1036536393, ; 150: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 151: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 286
	i32 1044663988, ; 152: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 153: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 242
	i32 1067306892, ; 154: GoogleGson => 0x3f9dcf8c => 173
	i32 1082857460, ; 155: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 156: Xamarin.Kotlin.StdLib => 0x409e66d8 => 276
	i32 1098259244, ; 157: System => 0x41761b2c => 164
	i32 1108272742, ; 158: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 308
	i32 1117529484, ; 159: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 302
	i32 1118262833, ; 160: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 298
	i32 1121599056, ; 161: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 241
	i32 1127624469, ; 162: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 186
	i32 1149092582, ; 163: Xamarin.AndroidX.Window => 0x447dc2e6 => 268
	i32 1168523401, ; 164: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 304
	i32 1170634674, ; 165: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 166: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 183
	i32 1175144683, ; 167: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 264
	i32 1178241025, ; 168: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 249
	i32 1204270330, ; 169: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 210
	i32 1208641965, ; 170: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 171: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1220193633, ; 172: Microsoft.Net.Http.Headers => 0x48baad61 => 196
	i32 1243150071, ; 173: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 269
	i32 1253011324, ; 174: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 175: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 284
	i32 1264511973, ; 176: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 259
	i32 1267360935, ; 177: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 263
	i32 1273260888, ; 178: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 215
	i32 1275534314, ; 179: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 280
	i32 1278448581, ; 180: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 207
	i32 1293217323, ; 181: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 226
	i32 1308624726, ; 182: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 293
	i32 1309188875, ; 183: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 184: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 268
	i32 1324164729, ; 185: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 186: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 187: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 313
	i32 1364015309, ; 188: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 189: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 314
	i32 1376866003, ; 190: Xamarin.AndroidX.SavedState => 0x52114ed3 => 255
	i32 1379779777, ; 191: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 192: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 193: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 219
	i32 1408764838, ; 194: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 195: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 196: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 197: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 282
	i32 1434145427, ; 198: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 199: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 272
	i32 1439761251, ; 200: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 201: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 202: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 203: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 204: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 205: es\Microsoft.Maui.Controls.resources => 0x57152abe => 288
	i32 1461234159, ; 206: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 207: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 208: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 209: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 209
	i32 1470490898, ; 210: Microsoft.Extensions.Primitives => 0x57a5e912 => 189
	i32 1479771757, ; 211: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 212: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 213: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 214: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 256
	i32 1526286932, ; 215: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 312
	i32 1536373174, ; 216: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 217: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 218: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 219: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565862583, ; 220: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 221: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 222: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 223: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 224: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 225
	i32 1592978981, ; 225: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 226: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 273
	i32 1601112923, ; 227: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 228: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 229: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 230: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 245
	i32 1622358360, ; 231: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 232: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 267
	i32 1635184631, ; 233: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 229
	i32 1636350590, ; 234: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 222
	i32 1639515021, ; 235: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 236: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 237: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 238: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 239: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 261
	i32 1658251792, ; 240: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 270
	i32 1670060433, ; 241: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 217
	i32 1675553242, ; 242: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 243: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 244: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 245: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 246: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 247: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 248: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 277
	i32 1701541528, ; 249: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 250: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 238
	i32 1726116996, ; 251: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 252: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 253: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 213
	i32 1743415430, ; 254: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 283
	i32 1744735666, ; 255: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 256: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 257: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 258: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 259: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 260: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 261: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 260
	i32 1770582343, ; 262: Microsoft.Extensions.Logging.dll => 0x6988f147 => 184
	i32 1776026572, ; 263: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 264: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 265: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 266: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 299
	i32 1788241197, ; 267: Xamarin.AndroidX.Fragment => 0x6a96652d => 231
	i32 1793755602, ; 268: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 291
	i32 1808609942, ; 269: Xamarin.AndroidX.Loader => 0x6bcd3296 => 245
	i32 1813058853, ; 270: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 276
	i32 1813201214, ; 271: Xamarin.Google.Android.Material => 0x6c13413e => 270
	i32 1818569960, ; 272: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 250
	i32 1818787751, ; 273: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1819327070, ; 274: Microsoft.AspNetCore.Http.Features.dll => 0x6c70ba5e => 177
	i32 1824175904, ; 275: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 276: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 277: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 185
	i32 1847515442, ; 278: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 200
	i32 1853025655, ; 279: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 308
	i32 1858542181, ; 280: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 281: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 282: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 290
	i32 1879696579, ; 283: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 284: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 211
	i32 1888955245, ; 285: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 286: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 287: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 284
	i32 1898237753, ; 288: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 289: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 290: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1928288591, ; 291: Microsoft.AspNetCore.Http.Abstractions => 0x72ef594f => 175
	i32 1939592360, ; 292: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 293: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 295
	i32 1956758971, ; 294: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 295: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 257
	i32 1968388702, ; 296: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 179
	i32 1983156543, ; 297: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 277
	i32 1985761444, ; 298: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 202
	i32 2003115576, ; 299: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 287
	i32 2011961780, ; 300: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 301: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 242
	i32 2031763787, ; 302: Xamarin.Android.Glide => 0x791a414b => 199
	i32 2045470958, ; 303: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 304: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 237
	i32 2060060697, ; 305: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 306: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 286
	i32 2070888862, ; 307: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2075706075, ; 308: Microsoft.AspNetCore.Http.Abstractions.dll => 0x7bb8c2db => 175
	i32 2079903147, ; 309: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 310: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 311: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 312: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 313: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 314: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 315: Microsoft.Maui => 0x80bd55ad => 193
	i32 2169148018, ; 316: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 294
	i32 2181898931, ; 317: Microsoft.Extensions.Options.dll => 0x820d22b3 => 188
	i32 2192057212, ; 318: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 185
	i32 2193016926, ; 319: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 320: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 281
	i32 2201231467, ; 321: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 322: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 187
	i32 2207618523, ; 323: it\Microsoft.Maui.Controls.resources => 0x839595db => 296
	i32 2217644978, ; 324: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 264
	i32 2222056684, ; 325: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2242871324, ; 326: Microsoft.AspNetCore.Http.dll => 0x85af801c => 174
	i32 2244775296, ; 327: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 246
	i32 2252106437, ; 328: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 329: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 330: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 331: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 180
	i32 2267999099, ; 332: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 201
	i32 2279755925, ; 333: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 253
	i32 2293034957, ; 334: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 335: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 336: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 337: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 300
	i32 2305521784, ; 338: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 339: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 205
	i32 2320631194, ; 340: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 341: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 342: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 343: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 344: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 294
	i32 2368005991, ; 345: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 346: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 179
	i32 2378619854, ; 347: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 348: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 349: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 295
	i32 2401565422, ; 350: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 351: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 228
	i32 2421380589, ; 352: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 353: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 215
	i32 2427813419, ; 354: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 292
	i32 2435356389, ; 355: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 356: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 357: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 358: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 359: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 360: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 218
	i32 2471841756, ; 361: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 362: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 363: Microsoft.Maui.Controls => 0x93dba8a1 => 191
	i32 2483903535, ; 364: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 365: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 366: System.AppContext.dll => 0x94798bc5 => 6
	i32 2497152587, ; 367: Microsoft.Toolkit.Mvvm => 0x94d7864b => 197
	i32 2501346920, ; 368: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 369: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 298
	i32 2505896520, ; 370: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 240
	i32 2522472828, ; 371: Xamarin.Android.Glide.dll => 0x9659e17c => 199
	i32 2538310050, ; 372: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 373: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 293
	i32 2562349572, ; 374: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 375: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 376: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 297
	i32 2581783588, ; 377: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 241
	i32 2581819634, ; 378: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 263
	i32 2585220780, ; 379: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 380: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 381: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 382: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 183
	i32 2593496499, ; 383: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 302
	i32 2605712449, ; 384: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 281
	i32 2615233544, ; 385: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 232
	i32 2616218305, ; 386: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 186
	i32 2617129537, ; 387: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 388: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 389: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 222
	i32 2624644809, ; 390: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 227
	i32 2626831493, ; 391: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 297
	i32 2627185994, ; 392: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 393: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 394: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 236
	i32 2633959305, ; 395: Microsoft.AspNetCore.Http.Extensions.dll => 0x9cff0789 => 176
	i32 2663391936, ; 396: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 201
	i32 2663698177, ; 397: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 398: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 399: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 400: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 401: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 402: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 403: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 261
	i32 2715334215, ; 404: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 405: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 406: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 407: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 408: Xamarin.AndroidX.Activity => 0xa2e0939b => 203
	i32 2735172069, ; 409: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 410: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 209
	i32 2740698338, ; 411: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 283
	i32 2740948882, ; 412: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 413: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 414: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 303
	i32 2758225723, ; 415: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 192
	i32 2764765095, ; 416: Microsoft.Maui.dll => 0xa4caf7a7 => 193
	i32 2765824710, ; 417: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 418: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 275
	i32 2778768386, ; 419: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 266
	i32 2779977773, ; 420: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 254
	i32 2785988530, ; 421: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 309
	i32 2788224221, ; 422: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 232
	i32 2801831435, ; 423: Microsoft.Maui.Graphics => 0xa7008e0b => 195
	i32 2803228030, ; 424: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 425: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 219
	i32 2819470561, ; 426: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 427: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 428: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 254
	i32 2824502124, ; 429: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2838993487, ; 430: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 243
	i32 2849599387, ; 431: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2850549256, ; 432: Microsoft.AspNetCore.Http.Features => 0xa9e7ee08 => 177
	i32 2853208004, ; 433: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 266
	i32 2855708567, ; 434: Xamarin.AndroidX.Transition => 0xaa36a797 => 262
	i32 2861098320, ; 435: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 436: Microsoft.Maui.Essentials => 0xaa8a4878 => 194
	i32 2870099610, ; 437: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 204
	i32 2875164099, ; 438: Jsr305Binding.dll => 0xab5f85c3 => 271
	i32 2875220617, ; 439: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 440: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 230
	i32 2887636118, ; 441: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 442: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 443: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 444: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 445: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 446: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 447: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 267
	i32 2919462931, ; 448: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 449: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 206
	i32 2936416060, ; 450: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 451: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 452: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2951916228, ; 453: TripAppFrontend => 0xaff2aac4 => 0
	i32 2959614098, ; 454: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 455: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 456: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 457: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 226
	i32 2987532451, ; 458: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 257
	i32 2996646946, ; 459: Microsoft.AspNetCore.Http => 0xb29d3422 => 174
	i32 2996846495, ; 460: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 239
	i32 3016983068, ; 461: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 259
	i32 3023353419, ; 462: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 463: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 234
	i32 3036999524, ; 464: Microsoft.AspNetCore.Http.Extensions => 0xb504ef64 => 176
	i32 3038032645, ; 465: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 316
	i32 3053864966, ; 466: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 289
	i32 3056245963, ; 467: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 256
	i32 3057625584, ; 468: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 247
	i32 3059408633, ; 469: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 470: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 471: System.Threading.Tasks => 0xb755818f => 144
	i32 3090735792, ; 472: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 473: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 474: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 475: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 476: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 477: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 478: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 479: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 480: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 481: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 482: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 483: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 248
	i32 3192346100, ; 484: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 485: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 486: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 487: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 488: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 225
	i32 3220365878, ; 489: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 490: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 491: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 492: Xamarin.AndroidX.CardView => 0xc235e84d => 213
	i32 3265493905, ; 493: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 494: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 495: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 496: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 497: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 498: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 499: System.Text.Encoding => 0xc4a8494a => 135
	i32 3300764913, ; 500: Microsoft.AspNetCore.WebUtilities => 0xc4bdacf1 => 178
	i32 3303498502, ; 501: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 502: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 289
	i32 3316684772, ; 503: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 504: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 223
	i32 3317144872, ; 505: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 506: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 211
	i32 3345895724, ; 507: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 252
	i32 3346324047, ; 508: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 249
	i32 3357674450, ; 509: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 306
	i32 3358260929, ; 510: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 511: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 204
	i32 3362522851, ; 512: Xamarin.AndroidX.Core => 0xc86c06e3 => 220
	i32 3366347497, ; 513: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 514: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 253
	i32 3381016424, ; 515: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 285
	i32 3395150330, ; 516: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 517: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 518: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 224
	i32 3428513518, ; 519: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 181
	i32 3429136800, ; 520: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 521: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 522: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 227
	i32 3445260447, ; 523: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 524: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 190
	i32 3458724246, ; 525: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 304
	i32 3471940407, ; 526: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 527: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 528: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 305
	i32 3485117614, ; 529: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 530: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 531: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 216
	i32 3509114376, ; 532: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 533: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 534: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 535: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 536: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 537: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 538: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 313
	i32 3592228221, ; 539: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 315
	i32 3597029428, ; 540: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 202
	i32 3598340787, ; 541: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 542: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 543: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 544: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 251
	i32 3633644679, ; 545: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 206
	i32 3638274909, ; 546: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 547: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 237
	i32 3643446276, ; 548: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 310
	i32 3643854240, ; 549: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 248
	i32 3645089577, ; 550: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3654326742, ; 551: Microsoft.Toolkit.Mvvm.dll => 0xd9d099d6 => 197
	i32 3657292374, ; 552: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 180
	i32 3660523487, ; 553: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 554: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 555: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 212
	i32 3684561358, ; 556: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 216
	i32 3700866549, ; 557: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 558: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 221
	i32 3716563718, ; 559: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 560: Xamarin.AndroidX.Annotation => 0xdda814c6 => 205
	i32 3724971120, ; 561: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 247
	i32 3732100267, ; 562: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 563: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 564: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 565: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 566: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 285
	i32 3765508441, ; 567: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 187
	i32 3786282454, ; 568: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 214
	i32 3792276235, ; 569: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 570: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 190
	i32 3802395368, ; 571: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 572: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 573: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 574: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 575: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 182
	i32 3844307129, ; 576: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 577: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 578: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 579: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 580: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 581: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 582: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 262
	i32 3888767677, ; 583: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 252
	i32 3896106733, ; 584: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 585: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 220
	i32 3901907137, ; 586: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 587: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 301
	i32 3920810846, ; 588: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 589: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 265
	i32 3928044579, ; 590: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 591: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 592: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 250
	i32 3945713374, ; 593: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 594: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 595: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 208
	i32 3959773229, ; 596: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 239
	i32 4003436829, ; 597: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 598: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 207
	i32 4025784931, ; 599: System.Memory => 0xeff49a63 => 62
	i32 4044155772, ; 600: Microsoft.Net.Http.Headers.dll => 0xf10ceb7c => 196
	i32 4046471985, ; 601: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 192
	i32 4054681211, ; 602: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 603: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 604: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 605: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 287
	i32 4094352644, ; 606: Microsoft.Maui.Essentials.dll => 0xf40add04 => 194
	i32 4099507663, ; 607: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 608: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 609: Xamarin.AndroidX.Emoji2 => 0xf479582c => 228
	i32 4103439459, ; 610: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 311
	i32 4126278185, ; 611: TripAppFrontend.dll => 0xf5f20229 => 0
	i32 4126470640, ; 612: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 181
	i32 4127667938, ; 613: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 614: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 615: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 616: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 311
	i32 4151237749, ; 617: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 618: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 619: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 620: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 621: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 622: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 244
	i32 4185676441, ; 623: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 624: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 625: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 626: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 300
	i32 4256097574, ; 627: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 221
	i32 4258378803, ; 628: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 243
	i32 4260525087, ; 629: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 630: Microsoft.Maui.Controls.dll => 0xfea12dee => 191
	i32 4274976490, ; 631: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 632: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 244
	i32 4294763496 ; 633: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 230
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [634 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 240, ; 3
	i32 274, ; 4
	i32 48, ; 5
	i32 282, ; 6
	i32 198, ; 7
	i32 80, ; 8
	i32 291, ; 9
	i32 145, ; 10
	i32 30, ; 11
	i32 315, ; 12
	i32 124, ; 13
	i32 195, ; 14
	i32 102, ; 15
	i32 299, ; 16
	i32 258, ; 17
	i32 107, ; 18
	i32 258, ; 19
	i32 139, ; 20
	i32 278, ; 21
	i32 314, ; 22
	i32 307, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 214, ; 27
	i32 132, ; 28
	i32 178, ; 29
	i32 260, ; 30
	i32 151, ; 31
	i32 18, ; 32
	i32 212, ; 33
	i32 26, ; 34
	i32 234, ; 35
	i32 1, ; 36
	i32 59, ; 37
	i32 42, ; 38
	i32 91, ; 39
	i32 217, ; 40
	i32 147, ; 41
	i32 236, ; 42
	i32 233, ; 43
	i32 54, ; 44
	i32 69, ; 45
	i32 312, ; 46
	i32 203, ; 47
	i32 83, ; 48
	i32 290, ; 49
	i32 235, ; 50
	i32 131, ; 51
	i32 55, ; 52
	i32 149, ; 53
	i32 74, ; 54
	i32 145, ; 55
	i32 62, ; 56
	i32 146, ; 57
	i32 316, ; 58
	i32 165, ; 59
	i32 310, ; 60
	i32 218, ; 61
	i32 12, ; 62
	i32 231, ; 63
	i32 125, ; 64
	i32 152, ; 65
	i32 113, ; 66
	i32 166, ; 67
	i32 164, ; 68
	i32 233, ; 69
	i32 246, ; 70
	i32 288, ; 71
	i32 84, ; 72
	i32 189, ; 73
	i32 150, ; 74
	i32 278, ; 75
	i32 60, ; 76
	i32 309, ; 77
	i32 184, ; 78
	i32 51, ; 79
	i32 103, ; 80
	i32 114, ; 81
	i32 40, ; 82
	i32 271, ; 83
	i32 269, ; 84
	i32 120, ; 85
	i32 52, ; 86
	i32 44, ; 87
	i32 119, ; 88
	i32 223, ; 89
	i32 301, ; 90
	i32 229, ; 91
	i32 81, ; 92
	i32 136, ; 93
	i32 265, ; 94
	i32 210, ; 95
	i32 8, ; 96
	i32 73, ; 97
	i32 155, ; 98
	i32 280, ; 99
	i32 154, ; 100
	i32 92, ; 101
	i32 275, ; 102
	i32 45, ; 103
	i32 279, ; 104
	i32 109, ; 105
	i32 129, ; 106
	i32 25, ; 107
	i32 200, ; 108
	i32 72, ; 109
	i32 55, ; 110
	i32 46, ; 111
	i32 307, ; 112
	i32 188, ; 113
	i32 224, ; 114
	i32 22, ; 115
	i32 238, ; 116
	i32 86, ; 117
	i32 43, ; 118
	i32 160, ; 119
	i32 71, ; 120
	i32 251, ; 121
	i32 292, ; 122
	i32 3, ; 123
	i32 42, ; 124
	i32 63, ; 125
	i32 306, ; 126
	i32 16, ; 127
	i32 53, ; 128
	i32 303, ; 129
	i32 274, ; 130
	i32 105, ; 131
	i32 198, ; 132
	i32 279, ; 133
	i32 296, ; 134
	i32 272, ; 135
	i32 235, ; 136
	i32 34, ; 137
	i32 158, ; 138
	i32 85, ; 139
	i32 32, ; 140
	i32 305, ; 141
	i32 12, ; 142
	i32 51, ; 143
	i32 56, ; 144
	i32 255, ; 145
	i32 36, ; 146
	i32 182, ; 147
	i32 273, ; 148
	i32 208, ; 149
	i32 35, ; 150
	i32 286, ; 151
	i32 58, ; 152
	i32 242, ; 153
	i32 173, ; 154
	i32 17, ; 155
	i32 276, ; 156
	i32 164, ; 157
	i32 308, ; 158
	i32 302, ; 159
	i32 298, ; 160
	i32 241, ; 161
	i32 186, ; 162
	i32 268, ; 163
	i32 304, ; 164
	i32 153, ; 165
	i32 183, ; 166
	i32 264, ; 167
	i32 249, ; 168
	i32 210, ; 169
	i32 29, ; 170
	i32 52, ; 171
	i32 196, ; 172
	i32 269, ; 173
	i32 5, ; 174
	i32 284, ; 175
	i32 259, ; 176
	i32 263, ; 177
	i32 215, ; 178
	i32 280, ; 179
	i32 207, ; 180
	i32 226, ; 181
	i32 293, ; 182
	i32 85, ; 183
	i32 268, ; 184
	i32 61, ; 185
	i32 112, ; 186
	i32 313, ; 187
	i32 57, ; 188
	i32 314, ; 189
	i32 255, ; 190
	i32 99, ; 191
	i32 19, ; 192
	i32 219, ; 193
	i32 111, ; 194
	i32 101, ; 195
	i32 102, ; 196
	i32 282, ; 197
	i32 104, ; 198
	i32 272, ; 199
	i32 71, ; 200
	i32 38, ; 201
	i32 32, ; 202
	i32 103, ; 203
	i32 73, ; 204
	i32 288, ; 205
	i32 9, ; 206
	i32 123, ; 207
	i32 46, ; 208
	i32 209, ; 209
	i32 189, ; 210
	i32 9, ; 211
	i32 43, ; 212
	i32 4, ; 213
	i32 256, ; 214
	i32 312, ; 215
	i32 31, ; 216
	i32 138, ; 217
	i32 92, ; 218
	i32 93, ; 219
	i32 49, ; 220
	i32 141, ; 221
	i32 112, ; 222
	i32 140, ; 223
	i32 225, ; 224
	i32 115, ; 225
	i32 273, ; 226
	i32 157, ; 227
	i32 76, ; 228
	i32 79, ; 229
	i32 245, ; 230
	i32 37, ; 231
	i32 267, ; 232
	i32 229, ; 233
	i32 222, ; 234
	i32 64, ; 235
	i32 138, ; 236
	i32 15, ; 237
	i32 116, ; 238
	i32 261, ; 239
	i32 270, ; 240
	i32 217, ; 241
	i32 48, ; 242
	i32 70, ; 243
	i32 80, ; 244
	i32 126, ; 245
	i32 94, ; 246
	i32 121, ; 247
	i32 277, ; 248
	i32 26, ; 249
	i32 238, ; 250
	i32 97, ; 251
	i32 28, ; 252
	i32 213, ; 253
	i32 283, ; 254
	i32 149, ; 255
	i32 169, ; 256
	i32 4, ; 257
	i32 98, ; 258
	i32 33, ; 259
	i32 93, ; 260
	i32 260, ; 261
	i32 184, ; 262
	i32 21, ; 263
	i32 41, ; 264
	i32 170, ; 265
	i32 299, ; 266
	i32 231, ; 267
	i32 291, ; 268
	i32 245, ; 269
	i32 276, ; 270
	i32 270, ; 271
	i32 250, ; 272
	i32 2, ; 273
	i32 177, ; 274
	i32 134, ; 275
	i32 111, ; 276
	i32 185, ; 277
	i32 200, ; 278
	i32 308, ; 279
	i32 58, ; 280
	i32 95, ; 281
	i32 290, ; 282
	i32 39, ; 283
	i32 211, ; 284
	i32 25, ; 285
	i32 94, ; 286
	i32 284, ; 287
	i32 89, ; 288
	i32 99, ; 289
	i32 10, ; 290
	i32 175, ; 291
	i32 87, ; 292
	i32 295, ; 293
	i32 100, ; 294
	i32 257, ; 295
	i32 179, ; 296
	i32 277, ; 297
	i32 202, ; 298
	i32 287, ; 299
	i32 7, ; 300
	i32 242, ; 301
	i32 199, ; 302
	i32 88, ; 303
	i32 237, ; 304
	i32 154, ; 305
	i32 286, ; 306
	i32 33, ; 307
	i32 175, ; 308
	i32 116, ; 309
	i32 82, ; 310
	i32 20, ; 311
	i32 11, ; 312
	i32 162, ; 313
	i32 3, ; 314
	i32 193, ; 315
	i32 294, ; 316
	i32 188, ; 317
	i32 185, ; 318
	i32 84, ; 319
	i32 281, ; 320
	i32 64, ; 321
	i32 187, ; 322
	i32 296, ; 323
	i32 264, ; 324
	i32 143, ; 325
	i32 174, ; 326
	i32 246, ; 327
	i32 157, ; 328
	i32 41, ; 329
	i32 117, ; 330
	i32 180, ; 331
	i32 201, ; 332
	i32 253, ; 333
	i32 131, ; 334
	i32 75, ; 335
	i32 66, ; 336
	i32 300, ; 337
	i32 172, ; 338
	i32 205, ; 339
	i32 143, ; 340
	i32 106, ; 341
	i32 151, ; 342
	i32 70, ; 343
	i32 294, ; 344
	i32 156, ; 345
	i32 179, ; 346
	i32 121, ; 347
	i32 127, ; 348
	i32 295, ; 349
	i32 152, ; 350
	i32 228, ; 351
	i32 141, ; 352
	i32 215, ; 353
	i32 292, ; 354
	i32 20, ; 355
	i32 14, ; 356
	i32 135, ; 357
	i32 75, ; 358
	i32 59, ; 359
	i32 218, ; 360
	i32 167, ; 361
	i32 168, ; 362
	i32 191, ; 363
	i32 15, ; 364
	i32 74, ; 365
	i32 6, ; 366
	i32 197, ; 367
	i32 23, ; 368
	i32 298, ; 369
	i32 240, ; 370
	i32 199, ; 371
	i32 91, ; 372
	i32 293, ; 373
	i32 1, ; 374
	i32 136, ; 375
	i32 297, ; 376
	i32 241, ; 377
	i32 263, ; 378
	i32 134, ; 379
	i32 69, ; 380
	i32 146, ; 381
	i32 183, ; 382
	i32 302, ; 383
	i32 281, ; 384
	i32 232, ; 385
	i32 186, ; 386
	i32 88, ; 387
	i32 96, ; 388
	i32 222, ; 389
	i32 227, ; 390
	i32 297, ; 391
	i32 31, ; 392
	i32 45, ; 393
	i32 236, ; 394
	i32 176, ; 395
	i32 201, ; 396
	i32 109, ; 397
	i32 158, ; 398
	i32 35, ; 399
	i32 22, ; 400
	i32 114, ; 401
	i32 57, ; 402
	i32 261, ; 403
	i32 144, ; 404
	i32 118, ; 405
	i32 120, ; 406
	i32 110, ; 407
	i32 203, ; 408
	i32 139, ; 409
	i32 209, ; 410
	i32 283, ; 411
	i32 54, ; 412
	i32 105, ; 413
	i32 303, ; 414
	i32 192, ; 415
	i32 193, ; 416
	i32 133, ; 417
	i32 275, ; 418
	i32 266, ; 419
	i32 254, ; 420
	i32 309, ; 421
	i32 232, ; 422
	i32 195, ; 423
	i32 159, ; 424
	i32 219, ; 425
	i32 163, ; 426
	i32 132, ; 427
	i32 254, ; 428
	i32 161, ; 429
	i32 243, ; 430
	i32 140, ; 431
	i32 177, ; 432
	i32 266, ; 433
	i32 262, ; 434
	i32 169, ; 435
	i32 194, ; 436
	i32 204, ; 437
	i32 271, ; 438
	i32 40, ; 439
	i32 230, ; 440
	i32 81, ; 441
	i32 56, ; 442
	i32 37, ; 443
	i32 97, ; 444
	i32 166, ; 445
	i32 172, ; 446
	i32 267, ; 447
	i32 82, ; 448
	i32 206, ; 449
	i32 98, ; 450
	i32 30, ; 451
	i32 159, ; 452
	i32 0, ; 453
	i32 18, ; 454
	i32 127, ; 455
	i32 119, ; 456
	i32 226, ; 457
	i32 257, ; 458
	i32 174, ; 459
	i32 239, ; 460
	i32 259, ; 461
	i32 165, ; 462
	i32 234, ; 463
	i32 176, ; 464
	i32 316, ; 465
	i32 289, ; 466
	i32 256, ; 467
	i32 247, ; 468
	i32 170, ; 469
	i32 16, ; 470
	i32 144, ; 471
	i32 125, ; 472
	i32 118, ; 473
	i32 38, ; 474
	i32 115, ; 475
	i32 47, ; 476
	i32 142, ; 477
	i32 117, ; 478
	i32 34, ; 479
	i32 173, ; 480
	i32 95, ; 481
	i32 53, ; 482
	i32 248, ; 483
	i32 129, ; 484
	i32 153, ; 485
	i32 24, ; 486
	i32 161, ; 487
	i32 225, ; 488
	i32 148, ; 489
	i32 104, ; 490
	i32 89, ; 491
	i32 213, ; 492
	i32 60, ; 493
	i32 142, ; 494
	i32 100, ; 495
	i32 5, ; 496
	i32 13, ; 497
	i32 122, ; 498
	i32 135, ; 499
	i32 178, ; 500
	i32 28, ; 501
	i32 289, ; 502
	i32 72, ; 503
	i32 223, ; 504
	i32 24, ; 505
	i32 211, ; 506
	i32 252, ; 507
	i32 249, ; 508
	i32 306, ; 509
	i32 137, ; 510
	i32 204, ; 511
	i32 220, ; 512
	i32 168, ; 513
	i32 253, ; 514
	i32 285, ; 515
	i32 101, ; 516
	i32 123, ; 517
	i32 224, ; 518
	i32 181, ; 519
	i32 163, ; 520
	i32 167, ; 521
	i32 227, ; 522
	i32 39, ; 523
	i32 190, ; 524
	i32 304, ; 525
	i32 17, ; 526
	i32 171, ; 527
	i32 305, ; 528
	i32 137, ; 529
	i32 150, ; 530
	i32 216, ; 531
	i32 155, ; 532
	i32 130, ; 533
	i32 19, ; 534
	i32 65, ; 535
	i32 147, ; 536
	i32 47, ; 537
	i32 313, ; 538
	i32 315, ; 539
	i32 202, ; 540
	i32 79, ; 541
	i32 61, ; 542
	i32 106, ; 543
	i32 251, ; 544
	i32 206, ; 545
	i32 49, ; 546
	i32 237, ; 547
	i32 310, ; 548
	i32 248, ; 549
	i32 14, ; 550
	i32 197, ; 551
	i32 180, ; 552
	i32 68, ; 553
	i32 171, ; 554
	i32 212, ; 555
	i32 216, ; 556
	i32 78, ; 557
	i32 221, ; 558
	i32 108, ; 559
	i32 205, ; 560
	i32 247, ; 561
	i32 67, ; 562
	i32 63, ; 563
	i32 27, ; 564
	i32 160, ; 565
	i32 285, ; 566
	i32 187, ; 567
	i32 214, ; 568
	i32 10, ; 569
	i32 190, ; 570
	i32 11, ; 571
	i32 78, ; 572
	i32 126, ; 573
	i32 83, ; 574
	i32 182, ; 575
	i32 66, ; 576
	i32 107, ; 577
	i32 65, ; 578
	i32 128, ; 579
	i32 122, ; 580
	i32 77, ; 581
	i32 262, ; 582
	i32 252, ; 583
	i32 8, ; 584
	i32 220, ; 585
	i32 2, ; 586
	i32 301, ; 587
	i32 44, ; 588
	i32 265, ; 589
	i32 156, ; 590
	i32 128, ; 591
	i32 250, ; 592
	i32 23, ; 593
	i32 133, ; 594
	i32 208, ; 595
	i32 239, ; 596
	i32 29, ; 597
	i32 207, ; 598
	i32 62, ; 599
	i32 196, ; 600
	i32 192, ; 601
	i32 90, ; 602
	i32 87, ; 603
	i32 148, ; 604
	i32 287, ; 605
	i32 194, ; 606
	i32 36, ; 607
	i32 86, ; 608
	i32 228, ; 609
	i32 311, ; 610
	i32 0, ; 611
	i32 181, ; 612
	i32 50, ; 613
	i32 6, ; 614
	i32 90, ; 615
	i32 311, ; 616
	i32 21, ; 617
	i32 162, ; 618
	i32 96, ; 619
	i32 50, ; 620
	i32 113, ; 621
	i32 244, ; 622
	i32 130, ; 623
	i32 76, ; 624
	i32 27, ; 625
	i32 300, ; 626
	i32 221, ; 627
	i32 243, ; 628
	i32 7, ; 629
	i32 191, ; 630
	i32 110, ; 631
	i32 244, ; 632
	i32 230 ; 633
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
