From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Draft 3 of bpf(2) man page for review
Date: Wed, 22 Jul 2015 22:10:39 +0200
Message-ID: <55AFF8BF.3050204@gmail.com>
References: <55AFE46F.3090800@gmail.com> <55AFED75.2030208@plumgrid.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AFED75.2030208-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/22/2015 09:22 PM, Alexei Starovoitov wrote:
> On 7/22/15 11:43 AM, Michael Kerrisk (man-pages) wrote:
>> .TH BPF 2 2015-03-10 "Linux" "Linux Programmer's Manual"
>=20
> should the date be updated ?

It'll get updated later, by scripts.

>> BPF maps are a generic data structure for storage of different data =
types.
>> A user process can create multiple maps (with key/value-pairs being
>> opaque bytes of data) and access them via file descriptors.
>> eBPF programs can access maps from inside the kernel in parallel.
>> .\"
>> .\" FIXME!! What does the previous sentence mean?
>> .\"
>> .\" Isn't "from inside the kernel" redundant? (I mean: all eBPF prog=
rams
>> .\" are running inside the kernel, right?)
>=20
> 99.9% of the time. yes. all eBPF programs are running inside the kern=
el,
> though recently I've seen two versions of 'user space eBPF' where
> kernel interpreter/x64_jit were ported to user space.
> If you think 'from kernel' is redundant, just drop it.

Okay. Done.

>> .\" And what does "in parallel" mean?
>> .\" Would a simpler version of this sentence be correct? As in:
>> .\"     "Different eBPF programs can access the same maps in paralle=
l."
>=20
> yes. different eBPF programs and user space processes can access the
> same maps in parallel.

Okay.

>> The new map has the type specified by
>> .IR map_type ,
>> and attributes as specified in
>> .IR key_size ,
>> .IR value_size ,
>> and
>> .IR max_entries .
>> .\" FIXME!! In the next sentence, what does "process-local" mean?
>> On success, this operation returns a process-local file descriptor.
>=20
> Just drop this unnecessary qualifier. Just 'returns a file descriptor=
'

Done.

>> .in +4n
>> .nf
>> bpf_map_lookup_elem(map_fd, fp - 4)
>> .fi
>> .in
>>
>> the program will be rejected,
>> since the in-kernel helper function
>>
>>      bpf_map_lookup_elem(map_fd, void *key)
>>
>> expects to read 8 bytes from
>> .I key
>> pointer, but
>> .IR "fp\ -\ 4"
>> .\" FIXME!! I'm lost! What is 'fp' in this context?
>=20
> it refers to 2nd argument of 'bpf_map_lookup_elem(map_fd, fp - 4)'
> fp =3D top of the stack.
> fp - 4 =3D pointer to 4 bytes below top of the stack.
> So 8 byte access from there will be out of bounds.

Okay. I added some words mentioning that 'fp' is top of stack.

>> The following map types are supported:
>> .TP
>> .B BPF_MAP_TYPE_HASH
>> .\" commit 0f8e4bd8a1fc8c4185f1630061d0a1f2d197a475
>> .\" FIXME!! Please review the following list of points, which draws
>> .\" heavily from the commit message, but reworks the text significan=
tly
>> .\" and so may have introduced errors.
>> Hash-table maps have the following characteristics:
>> .RS
>> .IP * 3
>> Maps are created and destroyed by user-space programs.
>> Both user-space and eBPF programs
>> can perform lookuo, update, and delete operations.
>=20
> typo 'lookup'

Thanks, fixed.

>> .IP *
>> The kernel takes care of allocating and freeing key/value pairs.
>> .IP *
>> The
>> .BR map_update_elem ()
>> helper with fail to insert new element when the
>> .I max_entries
>> limit is reached.
>> (This ensures that eBPF programs cannot exhaust memory.)
>> .IP *
>> .BR map_update_elem ()
>> replaces existing elements atomically.
>> .RE
>> .IP
>> Hash-table maps are
>> optimized for speed of lookup.
>> .TP
>> .B BPF_MAP_TYPE_ARRAY
>> .\" commit 28fbcfa08d8ed7c5a50d41a0433aad222835e8e3
>> .\" FIXME!! Please review the following list of points, which draws
>> .\" heavily from the commit message, but reworks the text significan=
tly
>> .\" and so may have introduced errors.
>> Array maps have the following characteristics:
>> .RS
>> .IP * 3
>> Optimized for fastest possible lookup.
>> In the future ithe verifier/JIT compiler
>=20
> typo 'the'

=46ixed.

>> may recognize lookup() operations that employ a constant key
>> and optimize it into constant pointer.
>> It is possible to optimize a non-constant
>> key into direct pointer arithmetic as well, since pointers and
>> .I value_size
>> are constant for the life of the eBPF program.
>> In other words,
>> .BR array_map_lookup_elem ()
>> may be 'inlined' by the verifier/JIT compiler
>> while preserving concurrent access to this map from user space.
>> .IP *
>> All array elements pre-allocated and zero initialized at init time
>> .IP *
>> The key is an array index, and must be exactly four bytes.
>> .IP *
>> .BR map_delete_elem ()
>> fails with the error
>> .BR EINVAL ,
>> since elements cannot be deleted.
>> .IP *
>> .BR map_update_elem ()
>> replaces elements in an non-atomic fashion;
>> for atomic updates, a hash-table map should be used instead.
>=20
> the description of hash and array maps looks good.

Okay. Thanks for checking.

>> .\" FIXME The following paragraph needs amending. Alexei commented:
>> .\"
>> .\"     Actually now in case of SOCKET_FILTER, SCHED_CLS, SCHED_ACT
>> .\"     the program can now access skb fields.
>> .\"     See 'struct __sk_buff' and commit 9bac3d6d548e5
>> .\"
>> .\" Do we want some text here to explain how the program access __sk=
_buff?
>=20
> I think commit 9bac3d6d548e5 tried to explain it, but translating
> that to english would be nice :)

Yes, but my C-to-English translator failed.

>> .\" FIXME!! Alexei, is the following correct?
>> eBPF objects (maps and programs) can be shared between processes.
>> For example, after
>> .BR fork (2),
>> the child inherits file descriptors referring to the same eBPF objec=
ts.
>> In addition, file descriptors referring to eBPF objects can be
>> transferred over UNIX domain sockets.
>> File descriptors referring to eBPF objects can be duplicated
>> in the usual way, using
>> .BR dup (2)
>> and similar calls.
>> An eBPF object is deallocated only after all file descriptors
>> referring to the object have been closed.
>=20
> yes. all correct.


Thanks.

>> eBPF programs can be written in a restricted C that is compiled (usi=
ng the
>> .B clang
>> compiler) into eBPF bytecode and executed on the in-kernel virtual m=
achine or
>> just-in-time compiled into native code.
>> (Various features are omitted from this restricted C, such as loops,
>> global variables, variadic functions, floating-point numbers,
>> and passing structures as function arguments.)
>> Some examples can be found in the
>> .I samples/bpf/*_kern.c
>> files in the kernel source tree.
>=20
> thanks. whole thing looks good.

Thanks.

Below is the current rendered version of the man page.

Cheers,

Michael


NAME
       bpf - perform a command on an extended eBPF map or program

SYNOPSIS
       #include <linux/bpf.h>

       int bpf(int cmd, union bpf_attr *attr, unsigned int size);

DESCRIPTION
       The  bpf()  system call performs a range of operations related t=
o
       extended Berkeley Packet Filters.  Extended BPF (or eBPF) is sim=
=E2=80=90
       ilar  to  the original ("classic") BPF (cBPF) used to filter net=
=E2=80=90
       work packets.  For both cBPF and eBPF programs, the kernel stati=
=E2=80=90
       cally  analyzes  the  programs  before  loading them, in order t=
o
       ensure that they cannot harm the running system.

       eBPF extends cBPF in multiple ways, including the ability to cal=
l
       a  fixed  set  of  in-kernel  helper  functions (via the BPF_CAL=
L
       opcode extension provided by eBPF) and access shared data  struc=
=E2=80=90
       tures such as eBPF maps.

   Extended BPF Design/Architecture
       BPF  maps  are  a generic data structure for storage of differen=
t
       data types.  A  user  process  can  create  multiple  maps  (wit=
h
       key/value-pairs  being  opaque bytes of data) and access them vi=
a
       file descriptors.  Differnt eBPF programs  can  access  the  sam=
e
       maps  in  parallel.  It's up to the user process and eBPF progra=
m
       to decide what they store inside maps.

       eBPF programs are similar to kernel modules.  They are loaded  b=
y
       the  user  process  and  automatically  unloaded when the proces=
s
       exits.  Each program is a set of instructions that is safe to ru=
n
       until  its  completion.   An in-kernel verifier statically deter=
=E2=80=90
       mines that the eBPF program terminates and is  safe  to  execute=
=2E
       During  verification,  the kernel increments reference counts fo=
r
       each of the maps that the eBPF program uses, so that the selecte=
d
       maps cannot be removed until the program is unloaded.

       eBPF  programs can be attached to different events.  These event=
s
       can be the arrival of network packets, tracing events,  classifi=
=E2=80=90
       cation  event  by  qdisc  (for  eBPF programs attached to a tc(8=
)
       classifier), and other types that may be added in the future.   =
A
       new event triggers execution of the eBPF program, which may stor=
e
       information about the event in eBPF maps.  Beyond  storing  data=
,
       eBPF programs may call a fixed set of in-kernel helper functions=
=2E
       The same eBPF program can be attached to multiple events and dif=
=E2=80=90
       ferent eBPF programs can access the same map:

           tracing     tracing     tracing     packet     packet
           event A     event B     event C     on eth0    on eth1
            |             |          |           |          |
            |             |          |           |          |
            --> tracing <--      tracing       socket     socket
                 prog_1           prog_2       prog_3     prog_4
                 |  |               |            |
              |---  -----|  |-------|           map_3
            map_1       map_2

   Arguments
       The  operation to be performed by the bpf() system call is deter=
=E2=80=90
       mined by the cmd argument.  Each operation takes an  accompanyin=
g
       argument,  provided  via  attr,  which is a pointer to a union o=
f
       type bpf_attr (see below).  The size argument is the size of  th=
e
       union pointed to by attr.

       The value provided in cmd is one of the following:

       BPF_MAP_CREATE
              Create a map with and return a file descriptor that refer=
s
              to the map.

       BPF_MAP_LOOKUP_ELEM
              Look up an element by key in a specified  map  and  retur=
n
              its value.

       BPF_MAP_UPDATE_ELEM
              Create  or  update an element (key/value pair) in a speci=
=E2=80=90
              fied map.

       BPF_MAP_DELETE_ELEM
              Look up and delete an element by key in a specified map.

       BPF_MAP_GET_NEXT_KEY
              Look up an element by key in a specified  map  and  retur=
n
              the key of the next element.

       BPF_PROG_LOAD
              Verify  and  load  an  eBPF  program, returning a new fil=
e
              descriptor associated with the program.

       The bpf_attr union consists of various anonymous structures  tha=
t
       are used by different bpf() commands:

           union bpf_attr {
               struct {    /* Used by BPF_MAP_CREATE */
                   __u32         map_type;
                   __u32         key_size;    /* size of key in bytes *=
/
                   __u32         value_size;  /* size of value in bytes=
 */
                   __u32         max_entries; /* maximum number of entr=
ies
                                                 in a map */
               };

               struct {    /* Used by BPF_MAP_*_ELEM and BPF_MAP_GET_NE=
XT_KEY
                              commands */
                   __u32         map_fd;
                   __aligned_u64 key;
                   union {
                       __aligned_u64 value;
                       __aligned_u64 next_key;
                   };
                   __u64         flags;
               };

               struct {    /* Used by BPF_PROG_LOAD */
                   __u32         prog_type;
                   __u32         insn_cnt;
                   __aligned_u64 insns;      /* 'const struct bpf_insn =
*' */
                   __aligned_u64 license;    /* 'const char *' */
                   __u32         log_level;  /* verbosity level of veri=
fier */
                   __u32         log_size;   /* size of user buffer */
                   __aligned_u64 log_buf;    /* user supplied 'char *'
                                                buffer */
                   __u32         kern_version;
                                             /* checked when prog_type=3D=
kprobe
                                                (since Linux 4.1) */
               };
           } __attribute__((aligned(8)));

   eBPF maps
       Maps  are a generic data structure for storage of different type=
s
       of data.  They allow sharing of data  between  eBPF  kernel  pro=
=E2=80=90
       grams, and also between kernel and user-space applications.

       Each map type has the following attributes:

       *  type
       *  maximum number of elements
       *  key size in bytes
       *  value size in bytes

       The  following  wrapper  functions  demonstrate how various bpf(=
)
       commands can be used to access the maps.  The functions  use  th=
e
       cmd argument to invoke different operations.

       BPF_MAP_CREATE
              The  BPF_MAP_CREATE command creates a new map, returning =
a
              new file descriptor that refers to the map.

                  int
                  bpf_create_map(enum bpf_map_type map_type, int key_si=
ze,
                                 int value_size, int max_entries)
                  {
                      union bpf_attr attr =3D {
                          .map_type =3D map_type,
                          .key_size =3D key_size,
                          .value_size =3D value_size,
                          .max_entries =3D max_entries
                      };

                      return bpf(BPF_MAP_CREATE, &attr, sizeof(attr));
                  }

              The new map  has  the  type  specified  by  map_type,  an=
d
              attributes  as  specified  in  key_size,  value_size,  an=
d
              max_entries.  On success, this operation  returns  a  fil=
e
              descriptor.   On error, -1 is returned and errno is set t=
o
              EINVAL, EPERM, or ENOMEM.

              The attributes key_size and value_size will be used by th=
e
              verifier  during program loading to check that the progra=
m
              is calling bpf_map_*_elem() helper functions with  a  cor=
=E2=80=90
              rectly  initialized  key  and  to  check  that the progra=
m
              doesn't access the map element value beyond the  specifie=
d
              value_size.   For  example,  when  a map is created with =
a
              key_size of 8 and the eBPF program calls

                  bpf_map_lookup_elem(map_fd, fp - 4)

              the program will be rejected, since the  in-kernel  helpe=
r
              function

                  bpf_map_lookup_elem(map_fd, void *key)

              expects  to  read  8 bytes from the location pointed to b=
y
              key, but the fp - 4 (where fp is the  top  of  the  stack=
)
              starting address will cause out-of-bounds stack access.

              Similarly,  when  a  map is created with a value_size of =
1
              and the eBPF program contains

                  value =3D bpf_map_lookup_elem(...);
                  *(u32 *) value =3D 1;

              the program will be rejected, since it accesses the  valu=
e
              pointer beyond the specified 1 byte value_size limit.

              Currently,   the   following   values  are  supported  fo=
r
              map_type:

                  enum bpf_map_type {
                      BPF_MAP_TYPE_UNSPEC,  /* Reserve 0 as invalid map=
 type */
                      BPF_MAP_TYPE_HASH,
                      BPF_MAP_TYPE_ARRAY,
                      BPF_MAP_TYPE_PROG_ARRAY,
                  };

              map_type selects one of the available map  implementation=
s
              in  the  kernel.   For all map types, eBPF programs acces=
s
              maps   with    the    same    bpf_map_lookup_elem()    an=
d
              bpf_map_update_elem()  helper  functions.  Further detail=
s
              of the various map types are given below.

       BPF_MAP_LOOKUP_ELEM
              The BPF_MAP_LOOKUP_ELEM command looks up an element with =
a
              given  key  in  the map referred to by the file descripto=
r
              fd.

                  int
                  bpf_lookup_elem(int fd, void *key, void *value)
                  {
                      union bpf_attr attr =3D {
                          .map_fd =3D fd,
                          .key =3D ptr_to_u64(key),
                          .value =3D ptr_to_u64(value),
                      };

                      return bpf(BPF_MAP_LOOKUP_ELEM, &attr, sizeof(att=
r));
                  }

              If an element is found, the  operation  returns  zero  an=
d
              stores the element's value into value, which must point t=
o
              a buffer of value_size bytes.

              If no element is found, the operation returns -1 and  set=
s
              errno to ENOENT.

       BPF_MAP_UPDATE_ELEM
              The BPF_MAP_UPDATE_ELEM command creates or updates an ele=
=E2=80=90
              ment with a given key/value in the map referred to by  th=
e
              file descriptor fd.

                  int
                  bpf_update_elem(int fd, void *key, void *value, __u64=
 flags)
                  {
                      union bpf_attr attr =3D {
                          .map_fd =3D fd,
                          .key =3D ptr_to_u64(key),
                          .value =3D ptr_to_u64(value),
                          .flags =3D flags,
                      };

                      return bpf(BPF_MAP_UPDATE_ELEM, &attr, sizeof(att=
r));
                  }

              The  flags argument should be specified as one of the fol=
=E2=80=90
              lowing:

              BPF_ANY
                     Create a new element or update an existing element=
=2E

              BPF_NOEXIST
                     Create a new element only if it did not exist.

              BPF_EXIST
                     Update an existing element.

              On success, the operation returns zero.  On error,  -1  i=
s
              returned  and  errno  is  set to EINVAL, EPERM, ENOMEM, o=
r
              E2BIG.  E2BIG indicates that the number of elements in th=
e
              map  reached  the  max_entries limit specified at map cre=
=E2=80=90
              ation time.  EEXIST will be returned  if  flags  specifie=
s
              BPF_NOEXIST and the element with key already exists in th=
e
              map.  ENOENT will be returned if flags specifies BPF_EXIS=
T
              and the element with key doesn't exist in the map.

       BPF_MAP_DELETE_ELEM
              The  BPF_MAP_DELETE_ELEM command deleted the element whos=
e
              key is key from the map referred to by the file descripto=
r
              fd.

                  int
                  bpf_delete_elem(int fd, void *key)
                  {
                      union bpf_attr attr =3D {
                          .map_fd =3D fd,
                          .key =3D ptr_to_u64(key),
                      };

                      return bpf(BPF_MAP_DELETE_ELEM, &attr, sizeof(att=
r));
                  }

              On  success,  zero  is  returned.   If  the element is no=
t
              found, -1 is returned and errno is set to ENOENT.

       BPF_MAP_GET_NEXT_KEY
              The BPF_MAP_GET_NEXT_KEY command looks up  an  element  b=
y
              key  in  the map referred to by the file descriptor fd an=
d
              sets the next_key pointer to the key of the next element.

                  int
                  bpf_get_next_key(int fd, void *key, void *next_key)
                  {
                      union bpf_attr attr =3D {
                          .map_fd =3D fd,
                          .key =3D ptr_to_u64(key),
                          .next_key =3D ptr_to_u64(next_key),
                      };

                      return bpf(BPF_MAP_GET_NEXT_KEY, &attr, sizeof(at=
tr));
                  }

              If key is found, the operation returns zero and  sets  th=
e
              next_key  pointer  to the key of the next element.  If ke=
y
              is not found, the operation  returns  zero  and  sets  th=
e
              next_key  pointer to the key of the first element.  If ke=
y
              is the last element, -1 is returned and errno  is  set  t=
o
              ENOENT.   Other  possible errno values are ENOMEM, EFAULT=
,
              EPERM, and EINVAL.  This method can  be  used  to  iterat=
e
              over all elements in the map.

       close(map_fd)
              Delete  the map referred to by the file descriptor map_fd=
=2E
              When the user-space program that created a map exits,  al=
l
              maps will be deleted automatically (but see NOTES).

   eBPF map types
       The following map types are supported:

       BPF_MAP_TYPE_HASH
              Hash-table maps have the following characteristics:

              *  Maps  are created and destroyed by user-space programs=
=2E
                 Both user-space and eBPF programs can  perform  lookup=
,
                 update, and delete operations.

              *  The   kernel  takes  care  of  allocating  and  freein=
g
                 key/value pairs.

              *  The map_update_elem() helper with fail  to  insert  ne=
w
                 element  when  the max_entries limit is reached.  (Thi=
s
                 ensures that eBPF programs cannot exhaust memory.)

              *  map_update_elem()  replaces  existing  elements  atomi=
=E2=80=90
                 cally.

              Hash-table maps are optimized for speed of lookup.

       BPF_MAP_TYPE_ARRAY
              Array maps have the following characteristics:

              *  Optimized  for  fastest possible lookup.  In the futur=
e
                 the verifier/JIT compiler may recognize lookup() opera=
=E2=80=90
                 tions  that  employ a constant key and optimize it int=
o
                 constant pointer.  It is possible to  optimize  a  non=
-
                 constant  key  into  direct pointer arithmetic as well=
,
                 since pointers and value_size are constant for the lif=
e
                 of    the    eBPF    program.     In    other    words=
,
                 array_map_lookup_elem() may be 'inlined' by  the  veri=
=E2=80=90
                 fier/JIT compiler while preserving concurrent access t=
o
                 this map from user space.

              *  All array elements pre-allocated and  zero  initialize=
d
                 at init time

              *  The  key  is  an  array index, and must be exactly fou=
r
                 bytes.

              *  map_delete_elem() fails with the  error  EINVAL,  sinc=
e
                 elements cannot be deleted.

              *  map_update_elem()  replaces  elements  in an non-atomi=
c
                 fashion; for atomic updates, a hash-table map should b=
e
                 used instead.

              Among the uses for array maps are the following:

              *  As "global" eBPF variables: an array of 1 element whos=
e
                 key is (index) 0 and where the value is a collection o=
f
                 'global'  variables which eBPF programs can use to kee=
p
                 state between events.

              *  Aggregation of tracing events into a fixed set of buck=
=E2=80=90
                 ets.

       BPF_MAP_TYPE_PROG_ARRAY (since Linux 4.2)
              [To be completed]

   eBPF programs
       The  BPF_PROG_LOAD  command  is used to load an eBPF program int=
o
       the kernel.  The return value for this  command  is  a  new  fil=
e
       descriptor associated with this eBPF program.

           char bpf_log_buf[LOG_BUF_SIZE];

           int
           bpf_prog_load(enum bpf_prog_type prog_type,
                         const struct bpf_insn *insns, int insn_cnt,
                         const char *license)
           {
               union bpf_attr attr =3D {
                   .prog_type =3D prog_type,
                   .insns =3D ptr_to_u64(insns),
                   .insn_cnt =3D insn_cnt,
                   .license =3D ptr_to_u64(license),
                   .log_buf =3D ptr_to_u64(bpf_log_buf),
                   .log_size =3D LOG_BUF_SIZE,
                   .log_level =3D 1,
               };

               return bpf(BPF_PROG_LOAD, &attr, sizeof(attr));
           }

       prog_type is one of the available program types:

           enum bpf_prog_type {
               BPF_PROG_TYPE_UNSPEC,        /* Reserve 0 as invalid
                                               program type */
               BPF_PROG_TYPE_SOCKET_FILTER,
               BPF_PROG_TYPE_KPROBE,
               BPF_PROG_TYPE_SCHED_CLS,
               BPF_PROG_TYPE_SCHED_ACT,
           };

       For further details of eBPF program types, see below.

       The remaining fields of bpf_attr are set as follows:

       *  insns is an array of struct bpf_insn instructions.

       *  insn_cnt is the number of instructions in the program referre=
d
          to by insns.

       *  license is a license string, which must be GPL  compatible  t=
o
          call helper functions marked gpl_only.

       *  log_buf is a pointer to a caller-allocated buffer in which th=
e
          in-kernel verifier can store the verification log.   This  lo=
g
          is  a  multi-line  string  that  can be checked by the progra=
m
          author in order to understand how the  verifier  came  to  th=
e
          conclusion  that the BPF program is unsafe.  The format of th=
e
          output can change at any time as the verifier evolves.

       *  log_size size of the buffer pointed to  by  log_bug.   If  th=
e
          size  of  the buffer is not large enough to store all verifie=
r
          messages, -1 is returned and errno is set to ENOSPC.

       *  log_level verbosity level of the verifier.  A  value  of  zer=
o
          means that the verifier will not provide a log.

       Applying   close(2)   to   the   file   descriptor   returned  b=
y
       BPF_PROG_LOAD will unload the eBPF program (but see NOTES).

       Maps are accessible from eBPF programs and are used  to  exchang=
e
       data  between  eBPF  programs and between eBPF programs and user=
-
       space programs.  For example, eBPF programs can  process  variou=
s
       events  (like  kprobe,  packets) and store their data into a map=
,
       and user-space programs can then fetch data from the  map.   Con=
=E2=80=90
       versely,  user-space  programs  can  use a map as a configuratio=
n
       mechanism, populating the map with values  checked  by  the  eBP=
=46
       program, which then modifies its behavior on the fly according t=
o
       those values.

   eBPF program types
       By picking prog_type, the program author selects a set of  helpe=
r
       functions that can be called from the eBPF program and the corre=
=E2=80=90
       sponding format of struct bpf_context (which  is  the  data  blo=
b
       passed  into  the eBPF program as the first argument).  For exam=
=E2=80=90
       ple,     programs     loaded     with     a     prog_type      o=
f
       BPF_PROG_TYPE_SOCKET_FILTER  may  call  the bpf_map_lookup_elem(=
)
       helper, whereas some other program  types  may  not  be  able  t=
o
       employ  this helper.  The set of functions available to eBPF pro=
=E2=80=90
       grams of a given type may increase in the future.

       The following program types are supported:

       BPF_PROG_TYPE_SOCKET_FILTER (since Linux 3.19)
              Currently,     the     set      of      functions      fo=
r
              BPF_PROG_TYPE_SOCKET_FILTER is:

                  bpf_map_lookup_elem(map_fd, void *key)
                                      /* look up key in a map_fd */
                  bpf_map_update_elem(map_fd, void *key, void *value)
                                      /* update key/value */
                  bpf_map_delete_elem(map_fd, void *key)
                                      /* delete key in a map_fd */

              The bpf_context argument is a pointer to a struct sk_buff=
=2E
              Programs cannot access the fields of sk_buff directly.

       BPF_PROG_TYPE_KPROBE (since Linux 4.1)
              [To be documented]

       BPF_PROG_TYPE_SCHED_CLS (since Linux 4.1)
              [To be documented]

       BPF_PROG_TYPE_SCHED_ACT (since Linux 4.1)
              [To be documented]

   Events
       Once a program is loaded, it can be attached to an event.   Vari=
=E2=80=90
       ous kernel subsystems have different ways to do so.

       Since  Linux  3.19,  the  following  call will attach the progra=
m
       prog_fd to the socket sockfd, which was  created  by  an  earlie=
r
       call to socket(2):

           setsockopt(sockfd, SOL_SOCKET, SO_ATTACH_BPF,
                      &prog_fd, sizeof(prog_fd));

       Since  Linux  4.1,  the  following call may be used to attach th=
e
       eBPF program referred to by the file descriptor prog_fd to a per=
f
       event  file  descriptor, event_fd, that was created by a previou=
s
       call to perf_event_open(2):

           ioctl(event_fd, PERF_EVENT_IOC_SET_BPF, prog_fd);

EXAMPLES
       /* bpf+sockets example:
        * 1. create array map of 256 elements
        * 2. load program that counts number of packets received
        *    r0 =3D skb->data[ETH_HLEN + offsetof(struct iphdr, protoco=
l)]
        *    map[r0]++
        * 3. attach prog_fd to raw socket via setsockopt()
        * 4. print number of received TCP/UDP packets every second
        */
       int
       main(int argc, char **argv)
       {
           int sock, map_fd, prog_fd, key;
           long long value =3D 0, tcp_cnt, udp_cnt;

           map_fd =3D bpf_create_map(BPF_MAP_TYPE_ARRAY, sizeof(key),
                                   sizeof(value), 256);
           if (map_fd < 0) {
               printf("failed to create map '%s'\n", strerror(errno));
               /* likely not run as root */
               return 1;
           }

           struct bpf_insn prog[] =3D {
               BPF_MOV64_REG(BPF_REG_6, BPF_REG_1),        /* r6 =3D r1=
 */
               BPF_LD_ABS(BPF_B, ETH_HLEN + offsetof(struct iphdr, prot=
ocol)),
                                       /* r0 =3D ip->proto */
               BPF_STX_MEM(BPF_W, BPF_REG_10, BPF_REG_0, -4),
                                       /* *(u32 *)(fp - 4) =3D r0 */
               BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),       /* r2 =3D fp=
 */
               BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -4),      /* r2 =3D r2=
 - 4 */
               BPF_LD_MAP_FD(BPF_REG_1, map_fd),           /* r1 =3D ma=
p_fd */
               BPF_CALL_FUNC(BPF_FUNC_map_lookup_elem),
                                       /* r0 =3D map_lookup(r1, r2) */
               BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 2),
                                       /* if (r0 =3D=3D 0) goto pc+2 */
               BPF_MOV64_IMM(BPF_REG_1, 1),                /* r1 =3D 1 =
*/
               BPF_XADD(BPF_DW, BPF_REG_0, BPF_REG_1, 0, 0),
                                       /* lock *(u64 *) r0 +=3D r1 */
               BPF_MOV64_IMM(BPF_REG_0, 0),                /* r0 =3D 0 =
*/
               BPF_EXIT_INSN(),                            /* return r0=
 */
           };

           prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, prog,
                                   sizeof(prog), "GPL");

           sock =3D open_raw_sock("lo");

           assert(setsockopt(sock, SOL_SOCKET, SO_ATTACH_BPF, &prog_fd,
                             sizeof(prog_fd)) =3D=3D 0);

           for (;;) {
               key =3D IPPROTO_TCP;
               assert(bpf_lookup_elem(map_fd, &key, &tcp_cnt) =3D=3D 0)=
;
               key =3D IPPROTO_UDP
               assert(bpf_lookup_elem(map_fd, &key, &udp_cnt) =3D=3D 0)=
;
               printf("TCP %lld UDP %lld packets0, tcp_cnt, udp_cnt);
               sleep(1);
           }

           return 0;
       }

       Some complete working code can be found in the samples/bpf direc=
=E2=80=90
       tory in the kernel source tree.

RETURN VALUE
       For a successful call, the return value depends on the operation=
:

       BPF_MAP_CREATE
              The new file descriptor associated with the eBPF map.

       BPF_PROG_LOAD
              The new file descriptor associated with the eBPF program.

       All other commands
              Zero.

       On error, -1 is returned, and errno is set appropriately.

ERRORS
       EPERM  The  call  was  made without sufficient privilege (withou=
t
              the CAP_SYS_ADMIN capability).

       ENOMEM Cannot allocate sufficient memory.

       EBADF  fd is not an open file descriptor

       EFAULT One of the pointers (key or value or log_buf or insns)  i=
s
              outside the accessible address space.

       EINVAL The  value specified in cmd is not recognized by this ker=
=E2=80=90
              nel.

       EINVAL For BPF_MAP_CREATE,  either  map_type  or  attributes  ar=
e
              invalid.

       EINVAL For  BPF_MAP_*_ELEM  commands, some of the fields of unio=
n
              bpf_attr that are not used by this command are not set  t=
o
              zero.

       EINVAL For BPF_PROG_LOAD, indicates an attempt to load an invali=
d
              program.  BPF programs  can  be  deemed  einvalid  due  t=
o
              unrecognized  instructions,  the  use  of reserved fields=
,
              jumps out of range, infinite loops  or  calls  of  unknow=
n
              functions.

       EACCES For  BPF_PROG_LOAD,  even  though all program instruction=
s
              are valid, the program has been rejected  because  it  wa=
s
              deemed unsafe.  This may be because it may have accessed =
a
              disallowed memory region or an uninitialized  stack/regis=
=E2=80=90
              ter  or  because  the function constraints don't match th=
e
              actual types or because  there  was  a  misaligned  memor=
y
              access.   In  this  case,  it is recommended to call bpf(=
)
              again with log_level =3D 1 and examine log_buf for the  s=
pe=E2=80=90
              cific reason provided by the verifier.

       ENOENT For  BPF_MAP_LOOKUP_ELEM or BPF_MAP_DELETE_ELEM, indicate=
s
              that the element with the given key was not found.

       E2BIG  The BPF  program  is  too  large  or  a  map  reached  th=
e
              max_entries limit (maximum number of elements).

VERSIONS
       The bpf() system call first appeared in Linux 3.18.

CONFORMING TO
       The bpf() system call is Linux-specific.

NOTES
       In  the  current  implementation,  all bpf() commands require th=
e
       caller to have the CAP_SYS_ADMIN capability.

       eBPF objects (maps and programs) can be shared between processes=
=2E
       For  example,  after fork(2), the child inherits file descriptor=
s
       referring to the same eBPF objects.  In addition,  file  descrip=
=E2=80=90
       tors  referring  to  eBPF  objects  can  be transferred over UNI=
X
       domain sockets.  File descriptors referring to eBPF  objects  ca=
n
       be  duplicated  in the usual way, using dup(2) and similar calls=
=2E
       An eBPF object is deallocated only  after  all  file  descriptor=
s
       referring to the object have been closed.

       eBPF  programs  can be written in a restricted C that is compile=
d
       (using the clang compiler) into eBPF bytecode and executed on th=
e
       in-kernel  virtual  machine  or just-in-time compiled into nativ=
e
       code.  (Various features are omitted from this restricted C, suc=
h
       as  loops,  global  variables, variadic functions, floating-poin=
t
       numbers, and passing structures  as  function  arguments.)   Som=
e
       examples  can  be  found in the samples/bpf/*_kern.c files in th=
e
       kernel source tree.

SEE ALSO
       seccomp(2), socket(7), tc(8), tc-bpf(8)

       Both classic and extended BPF are explained in the kernel  sourc=
e
       file Documentation/networking/filter.txt.


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
