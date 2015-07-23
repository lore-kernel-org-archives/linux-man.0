From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Draft 3 of bpf(2) man page for review
Date: Thu, 23 Jul 2015 13:23:54 +0200
Message-ID: <55B0CECA.2010105@gmail.com>
References: <55AFE46F.3090800@gmail.com> <55AFED75.2030208@plumgrid.com> <55AFF8BF.3050204@gmail.com> <55B0B461.1020201@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B0B461.1020201-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Daniel,

On 07/23/2015 11:31 AM, Daniel Borkmann wrote:
> Hi Michael,
>=20
> looks good already, a couple of comments inline, on top of Alexei's f=
eedback:
>=20
> On 07/22/2015 10:10 PM, Michael Kerrisk (man-pages) wrote:
> ...
>> NAME
>>         bpf - perform a command on an extended eBPF map or program
>=20
> 'extended eBPF' should perhaps just say 'eBPF' or 'extended BPF' (the
> 'e' itself stands for 'extended')

D'oh! Fixed.

>> SYNOPSIS
>>         #include <linux/bpf.h>
>>
>>         int bpf(int cmd, union bpf_attr *attr, unsigned int size);
>>
>> DESCRIPTION
>>         The  bpf()  system call performs a range of operations relat=
ed to
>>         extended Berkeley Packet Filters.  Extended BPF (or eBPF) is=
 sim=E2=80=90
>>         ilar  to  the original ("classic") BPF (cBPF) used to filter=
 net=E2=80=90
>>         work packets.  For both cBPF and eBPF programs, the kernel s=
tati=E2=80=90
>>         cally  analyzes  the  programs  before  loading them, in ord=
er to
>>         ensure that they cannot harm the running system.
>>
>>         eBPF extends cBPF in multiple ways, including the ability to=
 call
>>         a  fixed  set  of  in-kernel  helper  functions (via the BPF=
_CALL
>>         opcode extension provided by eBPF) and access shared data  s=
truc=E2=80=90
>>         tures such as eBPF maps.
>>
>>     Extended BPF Design/Architecture
>>         BPF  maps  are  a generic data structure for storage of diff=
erent
>=20
> Maybe s/BPF/eBPF/ as we introduced its definition above and used 'eBP=
=46 maps'
> just in the previous sentence.=20

Done.

> (I would from the onwards just use either eBPF
> or cBPF, makes it probably more clear).

Agreed. (I fixed a few other cases cases.)

>>         data types.  A  user  process  can  create  multiple  maps  =
(with
>>         key/value-pairs  being  opaque bytes of data) and access the=
m via
>>         file descriptors.  Differnt eBPF programs  can  access  the =
 same
>>         maps  in  parallel.  It's up to the user process and eBPF pr=
ogram
>>         to decide what they store inside maps.
>>
>>         eBPF programs are similar to kernel modules.  They are loade=
d  by
>>         the  user  process  and  automatically  unloaded when the pr=
ocess
>>         exits.  Each program is a set of instructions that is safe t=
o run
>=20
> The 1st and 2nd sentence in that order/combination may sounds a bit w=
eird.
> Maybe I would just drop the first sentence? I would argue that there =
might
> be a few similarities, but more differences overall. So I guess we'd =
either
> need to elaborate on the 1st sentence or just leave it out (could per=
haps
> be a FIXME comment to later on introduce a new section that elaborate=
s on
> both?).

I was also not quite happy with that first sentence. I've dropped it.

>>         until  its  completion.   An in-kernel verifier statically d=
eter=E2=80=90
>>         mines that the eBPF program terminates and is  safe  to  exe=
cute.
>>         During  verification,  the kernel increments reference count=
s for
>>         each of the maps that the eBPF program uses, so that the sel=
ected
>>         maps cannot be removed until the program is unloaded.
>=20
> s/selected/attached/ ?=20

Done.

> Btw, a user obviously can close() the map fds if he
> wants to, but ultimatively they're freed when the program unloads.

Okay. (Not sure if you meant that something should be added to the page=
=2E)

>>         eBPF  programs can be attached to different events.  These e=
vents
>>         can be the arrival of network packets, tracing events,  clas=
sifi=E2=80=90
>>         cation  event  by  qdisc  (for  eBPF programs attached to a =
tc(8)
>>         classifier), and other types that may be added in the future=
=2E   A
>=20
> Maybe: classification events by network queuing disciplines

Yes, better. Done.

>>         new event triggers execution of the eBPF program, which may =
store
>>         information about the event in eBPF maps.  Beyond  storing  =
data,
>>         eBPF programs may call a fixed set of in-kernel helper funct=
ions.
>=20
> I think this was mentioned before, but ok.
>=20
>>         The same eBPF program can be attached to multiple events and=
 dif=E2=80=90
>>         ferent eBPF programs can access the same map:
>>
>>             tracing     tracing     tracing     packet     packet
>>             event A     event B     event C     on eth0    on eth1
>>              |             |          |           |          |
>>              |             |          |           |          |
>>              --> tracing <--      tracing       socket     socket
>>                   prog_1           prog_2       prog_3     prog_4
>>                   |  |               |            |
>>                |---  -----|  |-------|           map_3
>>              map_1       map_2
>=20
> Maybe prog_4 example could also be: s/socket/tc ingress classifier/ ;=
)

Done.

>>     Arguments
>>         The  operation to be performed by the bpf() system call is d=
eter=E2=80=90
>>         mined by the cmd argument.  Each operation takes an  accompa=
nying
>>         argument,  provided  via  attr,  which is a pointer to a uni=
on of
>>         type bpf_attr (see below).  The size argument is the size of=
  the
>>         union pointed to by attr.
>>
>>         The value provided in cmd is one of the following:
>>
>>         BPF_MAP_CREATE
>>                Create a map with and return a file descriptor that r=
efers
>>                to the map.
>=20
> 'Create a map with and'

=46ixed.
=20
>>         BPF_MAP_LOOKUP_ELEM
>>                Look up an element by key in a specified  map  and  r=
eturn
>>                its value.
>>
>>         BPF_MAP_UPDATE_ELEM
>>                Create  or  update an element (key/value pair) in a s=
peci=E2=80=90
>>                fied map.
>>
>>         BPF_MAP_DELETE_ELEM
>>                Look up and delete an element by key in a specified m=
ap.
>>
>>         BPF_MAP_GET_NEXT_KEY
>>                Look up an element by key in a specified  map  and  r=
eturn
>>                the key of the next element.
>>
>>         BPF_PROG_LOAD
>>                Verify  and  load  an  eBPF  program, returning a new=
 file
>>                descriptor associated with the program.
>>
>>         The bpf_attr union consists of various anonymous structures =
 that
>>         are used by different bpf() commands:
>>
>>             union bpf_attr {
>>                 struct {    /* Used by BPF_MAP_CREATE */
>>                     __u32         map_type;
>>                     __u32         key_size;    /* size of key in byt=
es */
>>                     __u32         value_size;  /* size of value in b=
ytes */
>>                     __u32         max_entries; /* maximum number of =
entries
>>                                                   in a map */
>>                 };
>>
>>                 struct {    /* Used by BPF_MAP_*_ELEM and BPF_MAP_GE=
T_NEXT_KEY
>>                                commands */
>>                     __u32         map_fd;
>>                     __aligned_u64 key;
>>                     union {
>>                         __aligned_u64 value;
>>                         __aligned_u64 next_key;
>>                     };
>>                     __u64         flags;
>>                 };
>>
>>                 struct {    /* Used by BPF_PROG_LOAD */
>>                     __u32         prog_type;
>>                     __u32         insn_cnt;
>>                     __aligned_u64 insns;      /* 'const struct bpf_i=
nsn *' */
>>                     __aligned_u64 license;    /* 'const char *' */
>>                     __u32         log_level;  /* verbosity level of =
verifier */
>>                     __u32         log_size;   /* size of user buffer=
 */
>>                     __aligned_u64 log_buf;    /* user supplied 'char=
 *'
>>                                                  buffer */
>>                     __u32         kern_version;
>>                                               /* checked when prog_t=
ype=3Dkprobe
>>                                                  (since Linux 4.1) *=
/
>>                 };
>>             } __attribute__((aligned(8)));
>>
>>     eBPF maps
>>         Maps  are a generic data structure for storage of different =
types
>>         of data.  They allow sharing of data  between  eBPF  kernel =
 pro=E2=80=90
>>         grams, and also between kernel and user-space applications.
>>
>>         Each map type has the following attributes:
>>
>>         *  type
>>         *  maximum number of elements
>>         *  key size in bytes
>>         *  value size in bytes
>>
>>         The  following  wrapper  functions  demonstrate how various =
bpf()
>>         commands can be used to access the maps.  The functions  use=
  the
>>         cmd argument to invoke different operations.
>>
>>         BPF_MAP_CREATE
>>                The  BPF_MAP_CREATE command creates a new map, return=
ing a
>>                new file descriptor that refers to the map.
>>
>>                    int
>>                    bpf_create_map(enum bpf_map_type map_type, int ke=
y_size,
>>                                   int value_size, int max_entries)
>=20
> key_size, value_size and max_entries could rather be 'unsigned int' i=
n
> this API example.

Done. (This also should be fixed in the kernel source file
samples/bpf/libbpf.c. Same remark probably applies to some of your
other suggestions below.)

>>                    {
>>                        union bpf_attr attr =3D {
>>                            .map_type =3D map_type,
>>                            .key_size =3D key_size,
>>                            .value_size =3D value_size,
>>                            .max_entries =3D max_entries
>>                        };
>>
>>                        return bpf(BPF_MAP_CREATE, &attr, sizeof(attr=
));
>>                    }
>>
>>                The new map  has  the  type  specified  by  map_type,=
  and
>>                attributes  as  specified  in  key_size,  value_size,=
  and
>>                max_entries.  On success, this operation  returns  a =
 file
>>                descriptor.   On error, -1 is returned and errno is s=
et to
>>                EINVAL, EPERM, or ENOMEM.
>>
>>                The attributes key_size and value_size will be used b=
y the
>=20
> attribute's?

Nope. But I changed this to "The key_size and value_size attributes wil=
l be",
which may read clearer.

>>                verifier  during program loading to check that the pr=
ogram
>>                is calling bpf_map_*_elem() helper functions with  a =
 cor=E2=80=90
>>                rectly  initialized  key  and  to  check  that the pr=
ogram
>>                doesn't access the map element value beyond the  spec=
ified
>>                value_size.   For  example,  when  a map is created w=
ith a
>>                key_size of 8 and the eBPF program calls
>>
>>                    bpf_map_lookup_elem(map_fd, fp - 4)
>>
>>                the program will be rejected, since the  in-kernel  h=
elper
>>                function
>>
>>                    bpf_map_lookup_elem(map_fd, void *key)
>>
>>                expects  to  read  8 bytes from the location pointed =
to by
>>                key, but the fp - 4 (where fp is the  top  of  the  s=
tack)
>>                starting address will cause out-of-bounds stack acces=
s.
>>
>>                Similarly,  when  a  map is created with a value_size=
 of 1
>>                and the eBPF program contains
>>
>>                    value =3D bpf_map_lookup_elem(...);
>>                    *(u32 *) value =3D 1;
>>
>>                the program will be rejected, since it accesses the  =
value
>>                pointer beyond the specified 1 byte value_size limit.
>>
>>                Currently,   the   following   values  are  supported=
  for
>>                map_type:
>>
>>                    enum bpf_map_type {
>>                        BPF_MAP_TYPE_UNSPEC,  /* Reserve 0 as invalid=
 map type */
>>                        BPF_MAP_TYPE_HASH,
>>                        BPF_MAP_TYPE_ARRAY,
>>                        BPF_MAP_TYPE_PROG_ARRAY,
>>                    };
>>
>>                map_type selects one of the available map  implementa=
tions
>>                in  the  kernel.   For all map types, eBPF programs a=
ccess
>>                maps   with    the    same    bpf_map_lookup_elem()  =
  and
>>                bpf_map_update_elem()  helper  functions.  Further de=
tails
>>                of the various map types are given below.
>>
>>         BPF_MAP_LOOKUP_ELEM
>>                The BPF_MAP_LOOKUP_ELEM command looks up an element w=
ith a
>>                given  key  in  the map referred to by the file descr=
iptor
>>                fd.
>>
>>                    int
>>                    bpf_lookup_elem(int fd, void *key, void *value)
>=20
> It's just an API example implementation, and we cast the const away
> in ptr_to_u64() [which is not provided here, that's ok], but it docum=
ents
> the API itself better for those who implement it. I did the same in
> iproute2's tc/tc_bpf.c:
>=20
> const void *key

Done.

>>                        union bpf_attr attr =3D {
>>                            .map_fd =3D fd,
>>                            .key =3D ptr_to_u64(key),
>>                            .value =3D ptr_to_u64(value),
>>                        };
>>
>>                        return bpf(BPF_MAP_LOOKUP_ELEM, &attr, sizeof=
(attr));
>>                    }
>>
>>                If an element is found, the  operation  returns  zero=
  and
>>                stores the element's value into value, which must poi=
nt to
>>                a buffer of value_size bytes.
>>
>>                If no element is found, the operation returns -1 and =
 sets
>>                errno to ENOENT.
>>
>>         BPF_MAP_UPDATE_ELEM
>>                The BPF_MAP_UPDATE_ELEM command creates or updates an=
 ele=E2=80=90
>>                ment with a given key/value in the map referred to by=
  the
>>                file descriptor fd.
>>
>>                    int
>>                    bpf_update_elem(int fd, void *key, void *value, _=
_u64 flags)
>>                    {
>=20
> const void *key, const void *value, uint64_t flags

Done.

> The type __u64 is kernel internal, so if there's no strict reason to =
use it,
> we should just use what's provided by stdint.h.

Agreed. Done. (By the way, what about all the __u32 and __u64 elements =
in the
bpf_attr union?)

>>                        union bpf_attr attr =3D {
>>                            .map_fd =3D fd,
>>                            .key =3D ptr_to_u64(key),
>>                            .value =3D ptr_to_u64(value),
>>                            .flags =3D flags,
>>                        };
>>
>>                        return bpf(BPF_MAP_UPDATE_ELEM, &attr, sizeof=
(attr));
>>                    }
>>
>>                The  flags argument should be specified as one of the=
 fol=E2=80=90
>>                lowing:
>>
>>                BPF_ANY
>>                       Create a new element or update an existing ele=
ment.
>>
>>                BPF_NOEXIST
>>                       Create a new element only if it did not exist.
>>
>>                BPF_EXIST
>>                       Update an existing element.
>>
>>                On success, the operation returns zero.  On error,  -=
1  is
>>                returned  and  errno  is  set to EINVAL, EPERM, ENOME=
M, or
>>                E2BIG.  E2BIG indicates that the number of elements i=
n the
>>                map  reached  the  max_entries limit specified at map=
 cre=E2=80=90
>>                ation time.  EEXIST will be returned  if  flags  spec=
ifies
>>                BPF_NOEXIST and the element with key already exists i=
n the
>>                map.  ENOENT will be returned if flags specifies BPF_=
EXIST
>>                and the element with key doesn't exist in the map.
>>
>>         BPF_MAP_DELETE_ELEM
>>                The  BPF_MAP_DELETE_ELEM command deleted the element =
whose
>>                key is key from the map referred to by the file descr=
iptor
>>                fd.
>>
>>                    int
>>                    bpf_delete_elem(int fd, void *key)
>=20
> const void *key

Done.

>>                    {
>>                        union bpf_attr attr =3D {
>>                            .map_fd =3D fd,
>>                            .key =3D ptr_to_u64(key),
>>                        };
>>
>>                        return bpf(BPF_MAP_DELETE_ELEM, &attr, sizeof=
(attr));
>>                    }
>>
>>                On  success,  zero  is  returned.   If  the element i=
s not
>>                found, -1 is returned and errno is set to ENOENT.
>>
>>         BPF_MAP_GET_NEXT_KEY
>>                The BPF_MAP_GET_NEXT_KEY command looks up  an  elemen=
t  by
>>                key  in  the map referred to by the file descriptor f=
d and
>>                sets the next_key pointer to the key of the next elem=
ent.
>>
>>                    int
>>                    bpf_get_next_key(int fd, void *key, void *next_ke=
y)
>>                    {
>=20
> const void *key

Done.

>>                        union bpf_attr attr =3D {
>>                            .map_fd =3D fd,
>>                            .key =3D ptr_to_u64(key),
>>                            .next_key =3D ptr_to_u64(next_key),
>>                        };
>>
>>                        return bpf(BPF_MAP_GET_NEXT_KEY, &attr, sizeo=
f(attr));
>>                    }
>>
>>                If key is found, the operation returns zero and  sets=
  the
>>                next_key  pointer  to the key of the next element.  I=
f key
>>                is not found, the operation  returns  zero  and  sets=
  the
>>                next_key  pointer to the key of the first element.  I=
f key
>>                is the last element, -1 is returned and errno  is  se=
t  to
>>                ENOENT.   Other  possible errno values are ENOMEM, EF=
AULT,
>>                EPERM, and EINVAL.  This method can  be  used  to  it=
erate
>>                over all elements in the map.
>>
>>         close(map_fd)
>>                Delete  the map referred to by the file descriptor ma=
p_fd.
>>                When the user-space program that created a map exits,=
  all
>>                maps will be deleted automatically (but see NOTES).
>>
>>     eBPF map types
>>         The following map types are supported:
>>
>>         BPF_MAP_TYPE_HASH
>>                Hash-table maps have the following characteristics:
>>
>>                *  Maps  are created and destroyed by user-space prog=
rams.
>>                   Both user-space and eBPF programs can  perform  lo=
okup,
>>                   update, and delete operations.
>>
>>                *  The   kernel  takes  care  of  allocating  and  fr=
eeing
>>                   key/value pairs.
>>
>>                *  The map_update_elem() helper with fail  to  insert=
  new
>>                   element  when  the max_entries limit is reached.  =
(This
>>                   ensures that eBPF programs cannot exhaust memory.)
>>
>>                *  map_update_elem()  replaces  existing  elements  a=
tomi=E2=80=90
>>                   cally.
>>
>>                Hash-table maps are optimized for speed of lookup.
>>
>>         BPF_MAP_TYPE_ARRAY
>>                Array maps have the following characteristics:
>>
>>                *  Optimized  for  fastest possible lookup.  In the f=
uture
>>                   the verifier/JIT compiler may recognize lookup() o=
pera=E2=80=90
>>                   tions  that  employ a constant key and optimize it=
 into
>>                   constant pointer.  It is possible to  optimize  a =
 non-
>>                   constant  key  into  direct pointer arithmetic as =
well,
>>                   since pointers and value_size are constant for the=
 life
>>                   of    the    eBPF    program.     In    other    w=
ords,
>>                   array_map_lookup_elem() may be 'inlined' by  the  =
veri=E2=80=90
>>                   fier/JIT compiler while preserving concurrent acce=
ss to
>>                   this map from user space.
>>
>>                *  All array elements pre-allocated and  zero  initia=
lized
>>                   at init time
>>
>>                *  The  key  is  an  array index, and must be exactly=
 four
>>                   bytes.
>>
>>                *  map_delete_elem() fails with the  error  EINVAL,  =
since
>>                   elements cannot be deleted.
>>
>>                *  map_update_elem()  replaces  elements  in an non-a=
tomic
>>                   fashion; for atomic updates, a hash-table map shou=
ld be
>>                   used instead.
>=20
> This point here is most important, i.e. to not have false user expeca=
tions.
> Maybe it's also worth mentioning that when you have a value_size of s=
izeof(long),
> you can however use __sync_fetch_and_add() atomic builtin from the LL=
VM backend.

I think I'll leave out that detail for the moment.

>>                Among the uses for array maps are the following:
>>
>>                *  As "global" eBPF variables: an array of 1 element =
whose
>>                   key is (index) 0 and where the value is a collecti=
on of
>>                   'global'  variables which eBPF programs can use to=
 keep
>>                   state between events.
>>
>>                *  Aggregation of tracing events into a fixed set of =
buck=E2=80=90
>>                   ets.
>>
>>         BPF_MAP_TYPE_PROG_ARRAY (since Linux 4.2)
>>                [To be completed]
>>
>>     eBPF programs
>>         The  BPF_PROG_LOAD  command  is used to load an eBPF program=
 into
>>         the kernel.  The return value for this  command  is  a  new =
 file
>>         descriptor associated with this eBPF program.
>>
>>             char bpf_log_buf[LOG_BUF_SIZE];
>>
>>             int
>>             bpf_prog_load(enum bpf_prog_type prog_type,
>>                           const struct bpf_insn *insns, int insn_cnt=
,
>>                           const char *license)
>=20
> Maybe:
>=20
> int bpf_prog_load(enum bpf_prog_type type, const struct bpf_insn *ins=
ns,
> 		  unsigned int num_insns, const char *license)
>=20
> [ The double prog_type is redundant. ]

Done.

>>             {
>>                 union bpf_attr attr =3D {
>>                     .prog_type =3D prog_type,
>>                     .insns =3D ptr_to_u64(insns),
>>                     .insn_cnt =3D insn_cnt,
>>                     .license =3D ptr_to_u64(license),
>>                     .log_buf =3D ptr_to_u64(bpf_log_buf),
>>                     .log_size =3D LOG_BUF_SIZE,
>>                     .log_level =3D 1,
>>                 };
>=20
> Would be nice to have this indented properly, I mean that all should
> be aligned with tab before '=3D'. That would make it much easier to r=
ead.
> Also for all other code examples in this man-page (I forgot to mentio=
n
> it for the above).
=20
Done (for all examples).
=20
>>
>>                 return bpf(BPF_PROG_LOAD, &attr, sizeof(attr));
>>             }
>>
>>         prog_type is one of the available program types:
>>
>>             enum bpf_prog_type {
>>                 BPF_PROG_TYPE_UNSPEC,        /* Reserve 0 as invalid
>>                                                 program type */
>=20
> A pity that these *_UNSPEC types (also for the map) had to make it
> into the uapi. :(

Yes, it seemed odd to me.
=20
>>                 BPF_PROG_TYPE_SOCKET_FILTER,
>>                 BPF_PROG_TYPE_KPROBE,
>>                 BPF_PROG_TYPE_SCHED_CLS,
>>                 BPF_PROG_TYPE_SCHED_ACT,
>>             };
>>
>>         For further details of eBPF program types, see below.
>>
>>         The remaining fields of bpf_attr are set as follows:
>>
>>         *  insns is an array of struct bpf_insn instructions.
>>
>>         *  insn_cnt is the number of instructions in the program ref=
erred
>>            to by insns.
>>
>>         *  license is a license string, which must be GPL  compatibl=
e  to
>>            call helper functions marked gpl_only.
>=20
> Not strictly. So here, the same rules apply as with kernel modules. I=
=2Ee. what
> the kernel checks for are the following license strings:
>=20
> static inline int license_is_gpl_compatible(const char *license)
> {
> 	return (strcmp(license, "GPL") =3D=3D 0
> 		|| strcmp(license, "GPL v2") =3D=3D 0
> 		|| strcmp(license, "GPL and additional rights") =3D=3D 0
> 		|| strcmp(license, "Dual BSD/GPL") =3D=3D 0
> 		|| strcmp(license, "Dual MIT/GPL") =3D=3D 0
> 		|| strcmp(license, "Dual MPL/GPL") =3D=3D 0);
> }
>=20
> With any of them, the eBPF program is declared GPL compatible. Maybe =
of interest
> for those that want to use dual licensing of some sort.

So, I'm a little unclear here. What text do you suggest for the page?


>>         *  log_buf is a pointer to a caller-allocated buffer in whic=
h the
>>            in-kernel verifier can store the verification log.   This=
  log
>>            is  a  multi-line  string  that  can be checked by the pr=
ogram
>>            author in order to understand how the  verifier  came  to=
  the
>>            conclusion  that the BPF program is unsafe.  The format o=
f the
>>            output can change at any time as the verifier evolves.
>>
>>         *  log_size size of the buffer pointed to  by  log_bug.   If=
  the
>>            size  of  the buffer is not large enough to store all ver=
ifier
>>            messages, -1 is returned and errno is set to ENOSPC.
>>
>>         *  log_level verbosity level of the verifier.  A  value  of =
 zero
>>            means that the verifier will not provide a log.
>=20
> Note that the log buffer is optional as mentioned here log_level =3D =
0. The
> above example code of bpf_prog_load() suggests that it always needs t=
o be
> provided.
>=20
> I once ran indeed into an issue where the program itself was correct,=
 but
> it got rejected by the kernel, because my log buffer size was too sma=
ll, so
> in tc, we now have it larger as bpf_log_buf[65536] ...

So, I'm not clear. Do you mean that some piece of text here in the page=
=20
should be changed? If so, could elaborate?

>>         Applying   close(2)   to   the   file   descriptor   returne=
d  by
>>         BPF_PROG_LOAD will unload the eBPF program (but see NOTES).
>>
>>         Maps are accessible from eBPF programs and are used  to  exc=
hange
>>         data  between  eBPF  programs and between eBPF programs and =
user-
>>         space programs.  For example, eBPF programs can  process  va=
rious
>>         events  (like  kprobe,  packets) and store their data into a=
 map,
>>         and user-space programs can then fetch data from the  map.  =
 Con=E2=80=90
>>         versely,  user-space  programs  can  use a map as a configur=
ation
>>         mechanism, populating the map with values  checked  by  the =
 eBPF
>>         program, which then modifies its behavior on the fly accordi=
ng to
>>         those values.
>>
>>     eBPF program types
>>         By picking prog_type, the program author selects a set of  h=
elper
>>         functions that can be called from the eBPF program and the c=
orre=E2=80=90
>>         sponding format of struct bpf_context (which  is  the  data =
 blob
>>         passed  into  the eBPF program as the first argument).  For =
exam=E2=80=90
>=20
> I had to read this twice. ;) Maybe this needs to be reworded slightly=
=2E
>=20
> It just means that depending on the program type that the author sele=
cts,
> you might end up with a different subset of helper functions, and a
> different program input/context. For example tracing does not have th=
e
> exact same helpers as socket filters (it might have some that can be =
used
> by both). Also, the eBPF program input (context) for socket filters i=
s a
> network packet, wheras for tracing you operate on a set of registers.

Changed. Now we have:

   eBPF program types
       The eBPF program type (prog_type) determines the subset of a ker=
=E2=80=90
       nel helper functions that the program may call.  The program typ=
e
       also determines dthe program input (context)=E2=80=94the format =
of struct
       bpf_context (which is the data blob passed into the eBPF  progra=
m
       as the first argument).

       For  example, a tracing program does not have the exact same sub=
=E2=80=90
       set of helper functions as a socket filter program  (though  the=
y
       may have some helpers in common).  Similarly, the input (context=
)
       for a tracing program is a set of register values,  while  for  =
a
       socket filter it is a network packet.

       The  set  of functions available to eBPF programs of a given typ=
e
       may increase in the future.


>>         ple,     programs     loaded     with     a     prog_type   =
   of
>>         BPF_PROG_TYPE_SOCKET_FILTER  may  call  the bpf_map_lookup_e=
lem()
>>         helper, whereas some other program  types  may  not  be  abl=
e  to
>>         employ  this helper.  The set of functions available to eBPF=
 pro=E2=80=90
>>         grams of a given type may increase in the future.
>>
>>         The following program types are supported:
>>
>>         BPF_PROG_TYPE_SOCKET_FILTER (since Linux 3.19)
>>                Currently,     the     set      of      functions    =
  for
>>                BPF_PROG_TYPE_SOCKET_FILTER is:
>>
>>                    bpf_map_lookup_elem(map_fd, void *key)
>>                                        /* look up key in a map_fd */
>>                    bpf_map_update_elem(map_fd, void *key, void *valu=
e)
>>                                        /* update key/value */
>>                    bpf_map_delete_elem(map_fd, void *key)
>>                                        /* delete key in a map_fd */
>>
>>                The bpf_context argument is a pointer to a struct sk_=
buff.
>>                Programs cannot access the fields of sk_buff directly=
=2E
>>
>>         BPF_PROG_TYPE_KPROBE (since Linux 4.1)
>>                [To be documented]
>>
>>         BPF_PROG_TYPE_SCHED_CLS (since Linux 4.1)
>>                [To be documented]
>>
>>         BPF_PROG_TYPE_SCHED_ACT (since Linux 4.1)
>>                [To be documented]
>>
>>     Events
>>         Once a program is loaded, it can be attached to an event.   =
Vari=E2=80=90
>>         ous kernel subsystems have different ways to do so.
>>
>>         Since  Linux  3.19,  the  following  call will attach the pr=
ogram
>>         prog_fd to the socket sockfd, which was  created  by  an  ea=
rlier
>>         call to socket(2):
>>
>>             setsockopt(sockfd, SOL_SOCKET, SO_ATTACH_BPF,
>>                        &prog_fd, sizeof(prog_fd));
>>
>>         Since  Linux  4.1,  the  following call may be used to attac=
h the
>>         eBPF program referred to by the file descriptor prog_fd to a=
 perf
>>         event  file  descriptor, event_fd, that was created by a pre=
vious
>>         call to perf_event_open(2):
>>
>>             ioctl(event_fd, PERF_EVENT_IOC_SET_BPF, prog_fd);
>>
>> EXAMPLES
>>         /* bpf+sockets example:
>>          * 1. create array map of 256 elements
>>          * 2. load program that counts number of packets received
>>          *    r0 =3D skb->data[ETH_HLEN + offsetof(struct iphdr, pro=
tocol)]
>>          *    map[r0]++
>>          * 3. attach prog_fd to raw socket via setsockopt()
>>          * 4. print number of received TCP/UDP packets every second
>>          */
>>         int
>>         main(int argc, char **argv)
>>         {
>>             int sock, map_fd, prog_fd, key;
>>             long long value =3D 0, tcp_cnt, udp_cnt;
>>
>>             map_fd =3D bpf_create_map(BPF_MAP_TYPE_ARRAY, sizeof(key=
),
>>                                     sizeof(value), 256);
>>             if (map_fd < 0) {
>>                 printf("failed to create map '%s'\n", strerror(errno=
));
>>                 /* likely not run as root */
>>                 return 1;
>>             }
>>
>>             struct bpf_insn prog[] =3D {
>>                 BPF_MOV64_REG(BPF_REG_6, BPF_REG_1),        /* r6 =3D=
 r1 */
>>                 BPF_LD_ABS(BPF_B, ETH_HLEN + offsetof(struct iphdr, =
protocol)),
>>                                         /* r0 =3D ip->proto */
>>                 BPF_STX_MEM(BPF_W, BPF_REG_10, BPF_REG_0, -4),
>>                                         /* *(u32 *)(fp - 4) =3D r0 *=
/
>>                 BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),       /* r2 =3D=
 fp */
>>                 BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -4),      /* r2 =3D=
 r2 - 4 */
>>                 BPF_LD_MAP_FD(BPF_REG_1, map_fd),           /* r1 =3D=
 map_fd */
>>                 BPF_CALL_FUNC(BPF_FUNC_map_lookup_elem),
>>                                         /* r0 =3D map_lookup(r1, r2)=
 */
>>                 BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 2),
>>                                         /* if (r0 =3D=3D 0) goto pc+=
2 */
>>                 BPF_MOV64_IMM(BPF_REG_1, 1),                /* r1 =3D=
 1 */
>>                 BPF_XADD(BPF_DW, BPF_REG_0, BPF_REG_1, 0, 0),
>>                                         /* lock *(u64 *) r0 +=3D r1 =
*/
>>                 BPF_MOV64_IMM(BPF_REG_0, 0),                /* r0 =3D=
 0 */
>>                 BPF_EXIT_INSN(),                            /* retur=
n r0 */
>>             };
>>
>>             prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, p=
rog,
>>                                     sizeof(prog), "GPL");
>>
>>             sock =3D open_raw_sock("lo");
>>
>>             assert(setsockopt(sock, SOL_SOCKET, SO_ATTACH_BPF, &prog=
_fd,
>>                               sizeof(prog_fd)) =3D=3D 0);
>>
>>             for (;;) {
>>                 key =3D IPPROTO_TCP;
>>                 assert(bpf_lookup_elem(map_fd, &key, &tcp_cnt) =3D=3D=
 0);
>>                 key =3D IPPROTO_UDP
>>                 assert(bpf_lookup_elem(map_fd, &key, &udp_cnt) =3D=3D=
 0);
>>                 printf("TCP %lld UDP %lld packets0, tcp_cnt, udp_cnt=
);
>>                 sleep(1);
>>             }
>>
>>             return 0;
>>         }
>>
>>         Some complete working code can be found in the samples/bpf d=
irec=E2=80=90
>>         tory in the kernel source tree.
>>
>> RETURN VALUE
>>         For a successful call, the return value depends on the opera=
tion:
>>
>>         BPF_MAP_CREATE
>>                The new file descriptor associated with the eBPF map.
>>
>>         BPF_PROG_LOAD
>>                The new file descriptor associated with the eBPF prog=
ram.
>>
>>         All other commands
>>                Zero.
>>
>>         On error, -1 is returned, and errno is set appropriately.
>>
>> ERRORS
>>         EPERM  The  call  was  made without sufficient privilege (wi=
thout
>>                the CAP_SYS_ADMIN capability).
>>
>>         ENOMEM Cannot allocate sufficient memory.
>>
>>         EBADF  fd is not an open file descriptor
>>
>>         EFAULT One of the pointers (key or value or log_buf or insns=
)  is
>>                outside the accessible address space.
>>
>>         EINVAL The  value specified in cmd is not recognized by this=
 ker=E2=80=90
>>                nel.
>>
>>         EINVAL For BPF_MAP_CREATE,  either  map_type  or  attributes=
  are
>>                invalid.
>>
>>         EINVAL For  BPF_MAP_*_ELEM  commands, some of the fields of =
union
>>                bpf_attr that are not used by this command are not se=
t  to
>>                zero.
>>
>>         EINVAL For BPF_PROG_LOAD, indicates an attempt to load an in=
valid
>>                program.  BPF programs  can  be  deemed  einvalid  du=
e  to
>>                unrecognized  instructions,  the  use  of reserved fi=
elds,
>>                jumps out of range, infinite loops  or  calls  of  un=
known
>>                functions.
>>
>>         EACCES For  BPF_PROG_LOAD,  even  though all program instruc=
tions
>>                are valid, the program has been rejected  because  it=
  was
>>                deemed unsafe.  This may be because it may have acces=
sed a
>>                disallowed memory region or an uninitialized  stack/r=
egis=E2=80=90
>>                ter  or  because  the function constraints don't matc=
h the
>>                actual types or because  there  was  a  misaligned  m=
emory
>>                access.   In  this  case,  it is recommended to call =
bpf()
>>                again with log_level =3D 1 and examine log_buf for th=
e  spe=E2=80=90
>>                cific reason provided by the verifier.
>>
>>         ENOENT For  BPF_MAP_LOOKUP_ELEM or BPF_MAP_DELETE_ELEM, indi=
cates
>>                that the element with the given key was not found.
>>
>>         E2BIG  The BPF  program  is  too  large  or  a  map  reached=
  the
>>                max_entries limit (maximum number of elements).
>>
>> VERSIONS
>>         The bpf() system call first appeared in Linux 3.18.
>>
>> CONFORMING TO
>>         The bpf() system call is Linux-specific.
>>
>> NOTES
>>         In  the  current  implementation,  all bpf() commands requir=
e the
>>         caller to have the CAP_SYS_ADMIN capability.
>>
>>         eBPF objects (maps and programs) can be shared between proce=
sses.
>>         For  example,  after fork(2), the child inherits file descri=
ptors
>>         referring to the same eBPF objects.  In addition,  file  des=
crip=E2=80=90
>>         tors  referring  to  eBPF  objects  can  be transferred over=
 UNIX
>>         domain sockets.  File descriptors referring to eBPF  objects=
  can
>>         be  duplicated  in the usual way, using dup(2) and similar c=
alls.
>>         An eBPF object is deallocated only  after  all  file  descri=
ptors
>>         referring to the object have been closed.
>>
>>         eBPF  programs  can be written in a restricted C that is com=
piled
>>         (using the clang compiler) into eBPF bytecode and executed o=
n the
>>         in-kernel  virtual  machine  or just-in-time compiled into n=
ative
>>         code.  (Various features are omitted from this restricted C,=
 such
>>         as  loops,  global  variables, variadic functions, floating-=
point
>>         numbers, and passing structures  as  function  arguments.)  =
 Some
>>         examples  can  be  found in the samples/bpf/*_kern.c files i=
n the
>>         kernel source tree.
>=20
> I would also make a note about the JIT compiler here, i.e. that it's =
disabled
> by default, and can be enabled via:
>=20
> * Normal mode: echo 1 > /proc/sys/net/core/bpf_jit_enable
>=20
> * Debugging mode: echo 2 > /proc/sys/net/core/bpf_jit_enable
>    [opcodes dumped in hex into the kernel log, which can then be disa=
ssembled

Here, I assume you mean thet the generated (native) opcodes are dumpeed=
, right?

>     with tools/net/bpf_jit_disasm.c from the kernel tree]
>
> When enabled, after a eBPF program gets loaded, it's transparently co=
mpiled /
> translated inside the kernel into machine opcodes for better performa=
nce,
> currently on x86_64, arm64 and s390.

According to Documentation/networking/filter.txt the JIT compiler suppo=
rts
many more architectures:
=20
    The Linux kernel has a built-in BPF JIT compiler for x86_64,=20
    SPARC, PowerPC, ARM, ARM64, MIPS and s390 and can be enabled=20
    through CONFIG_BPF_JIT.

Or am I misunderstanding something?

I added the following:

       The kernel contains a just-in-time (JIT) compiler that translate=
s
       eBPF  bytecode  into  native machine code for better performance=
=2E
       The JIT compiler is disabled by default, but its operation can b=
e
       controlled   by   writing   one   of   the  following  values  t=
o
       /proc/sys/net/core/bpf_jit_enable:

       0  Disable JIT compilation (default).

       1  Normal compilation.

       2  Debugging mode.  The generated opcodes are dumped in hexadeci=
=E2=80=90
          mal  into the kernel log.  These opcodes can then be disassem=
=E2=80=90
          bled using the program tools/net/bpf_jit_disasm.c provided  i=
n
          the kernel source tree.

>> SEE ALSO
>>         seccomp(2), socket(7), tc(8), tc-bpf(8)
>>
>>         Both classic and extended BPF are explained in the kernel  s=
ource
>>         file Documentation/networking/filter.txt.
>>
>=20
> Thanks for all the work!

You're welcome. Thanks for the help!

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
