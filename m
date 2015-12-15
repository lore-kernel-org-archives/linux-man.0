From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: futex(3) man page, final draft for pre-release review
Date: Tue, 15 Dec 2015 14:43:50 +0100
Message-ID: <56701916.4090203@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bert hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Daniel Wagner <wagi-kQCPcA+X3s7YtjvyW6yDsg@public.gmane.org>, Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

After much too long a time, the revised futex man page *will*
go out in the next man pages release (it has been merged
into master).

There are various places where the page could still be improved,
but it is much better (and more than 5 times longer) than the
existing page.

The rendered version of the page is shown below, so that people
can make any final comments/suggestions for improvements
before the release (but of course I'll also take any
improvements after release as well). The page source is
available from the Git repo=20
(http://git.kernel.org/cgit/docs/man-pages/man-pages.git).

As I mention above, there are various places where the page
could still be better, so the rendered text below is annotated
with some FIXMEs, in case anyone wants to address these before
release.

Thanks

Michael


   NAME
       futex - fast user-space locking

   SYNOPSIS
       #include <linux/futex.h>
       #include <sys/time.h>

       int futex(int *uaddr, int futex_op, int val,
                 const struct timespec *timeout,   /* or: uint32_t val2=
 */
                 int *uaddr2, int val3);

       Note: There is no glibc wrapper for this system call; see NOTES.

   DESCRIPTION
       The  futex()  system  call  provides a method for waiting until =
a
       certain condition becomes true.  It is typically used as a block=
=E2=80=90
       ing  construct  in  the context of shared-memory synchronization=
=2E
       When using futexes, the majority of  the  synchronization  opera=
=E2=80=90
       tions  are  performed  in  user  space.   The  user-space progra=
m
       employs the futex() system call only when it is likely  that  th=
e
       program  has  to  block  for  a  longer  time until the conditio=
n
       becomes true.  The program uses another futex() operation to wak=
e
       anyone waiting for a particular condition.

       A futex is a 32-bit value=E2=80=94referred to below as a futex w=
ord=E2=80=94whose
       address is supplied to the futex() system call.  (Futexes are  3=
2
       bits  in  size  on all platforms, including 64-bit systems.)  Al=
l
       futex operations are governed by this value.  In order to share =
a
       futex  between  processes,  the  futex  is  placed in a region o=
f
       shared memory, created using (for example) mmap(2)  or  shmat(2)=
=2E
       (Thus,  the  futex  word  may have different virtual addresses i=
n
       different processes, but these addresses all refer  to  the  sam=
e
       location  in physical memory.)  In a multithreaded program, it i=
s
       sufficient to place the futex word in a global variable shared b=
y
       all threads.

       When executing a futex operation that requests to block a thread=
,
       the kernel will block only if the futex word has the  value  tha=
t
       the  calling  thread  supplied  (as  one  of the arguments of th=
e
       futex() call) as the expected value of the futex word.  The load=
=E2=80=90
       ing  of the futex word's value, the comparison of that value wit=
h
       the expected value, and the actual blocking  will  happen  atomi=
=E2=80=90

=46IXME: for next line, it would be good to have an explanation of
"totally ordered" somewhere around here.

       cally  and totally ordered with respect to concurrently executin=
g
       futex operations on the same futex word.  Thus, the futex word i=
s
       used to connect the synchronization in user space with the imple=
=E2=80=90
       mentation of blocking by the kernel.  Analogously  to  an  atomi=
c
       compare-and-exchange  operation  that  potentially changes share=
d
       memory, blocking via a futex is an atomic compare-and-block oper=
=E2=80=90
       ation.

       One  use  of futexes is for implementing locks.  The state of th=
e
       lock (i.e., acquired or not acquired) can be  represented  as  a=
n
       atomically  accessed  flag  in shared memory.  In the uncontende=
d
       case, a thread can access or modify the lock  state  with  atomi=
c
       instructions,   for  example  atomically  changing  it  from  no=
t
       acquired  to  acquired  using  an   atomic   compare-and-exchang=
e
       instruction.   (Such  instructions are performed entirely in use=
r
       mode, and the kernel maintains  no  information  about  the  loc=
k
       state.)   On  the other hand, a thread may be unable to acquire =
a
       lock because it is already acquired by another thread.   It  the=
n
       may pass the lock's flag as a futex word and the value represent=
=E2=80=90
       ing the acquired state as the expected value to  a  futex()  wai=
t
       operation.   This futex() call will block if and only if the loc=
k
       is still acquired.  When releasing the  lock,  a  thread  has  t=
o
       first  reset  the  lock  state to not acquired and then execute =
a
       futex operation that wakes threads blocked on the lock flag  use=
d
       as a futex word (this can be be further optimized to avoid unnec=
=E2=80=90
       essary wake-ups).  See futex(7) for more detail  on  how  to  us=
e
       futexes.

       Besides the basic wait and wake-up futex functionality, there ar=
e
       further futex operations aimed at  supporting  more  complex  us=
e
       cases.

       Note that no explicit initialization or destruction are necessar=
y
       to use futexes; the kernel maintains a futex (i.e.,  the  kernel=
-
       internal  implementation  artifact) only while operations such a=
s
       FUTEX_WAIT, described below, are being performed on a  particula=
r
       futex word.

   Arguments
       The  uaddr  argument points to the futex word.  On all platforms=
,
       futexes are four-byte integers that must be aligned  on  a  four=
-
       byte  boundary.   The operation to perform on the futex is speci=
=E2=80=90
       fied in the futex_op argument; val is a value whose  meaning  an=
d
       purpose depends on futex_op.

       The  remaining arguments (timeout, uaddr2, and val3) are require=
d
       only for certain of the futex operations described below.   Wher=
e
       one of these arguments is not required, it is ignored.

       For  several  blocking  operations,  the  timeout  argument  is =
a
       pointer to a timespec structure that specifies a timeout for  th=
e
       operation.   However,  notwithstanding the prototype shown above=
,
       for some operations, the least significant four bytes are used a=
s
       an  integer  whose  meaning  is determined by the operation.  Fo=
r
       these operations, the kernel casts the  timeout  value  first  t=
o
       unsigned  long,  then  to  uint32_t, and in the remainder of thi=
s
       page, this argument is referred to as val2  when  interpreted  i=
n
       this fashion.

       Where  it is required, the uaddr2 argument is a pointer to a sec=
=E2=80=90
       ond futex word that is employed by the operation.  The  interpre=
=E2=80=90
       tation of the final integer argument, val3, depends on the opera=
=E2=80=90
       tion.

   Futex operations
       The futex_op argument consists of two parts: a command that spec=
=E2=80=90
       ifies  the  operation to be performed, bit-wise ORed with zero o=
r
       or more options that modify the behaviour of the operation.   Th=
e
       options that may be included in futex_op are as follows:

       FUTEX_PRIVATE_FLAG (since Linux 2.6.22)
              This option bit can be employed with all futex operations=
=2E
              It tells the kernel that the futex is process-private  an=
d
              not  shared  with  another process (i.e., it is being use=
d
              for synchronization  only  between  threads  of  the  sam=
e
              process).   This allows the kernel to make some additiona=
l
              performance optimizations.

              As a convenience, <linux/futex.h> defines a  set  of  con=
=E2=80=90
              stants  with  the  suffix _PRIVATE that are equivalents o=
f
              all  of  the  operations  listed  below,  but   with   th=
e
              FUTEX_PRIVATE_FLAG  ORed  into  the constant value.  Thus=
,
              there are FUTEX_WAIT_PRIVATE, FUTEX_WAKE_PRIVATE,  and  s=
o
              on.

       FUTEX_CLOCK_REALTIME (since Linux 2.6.28)
              This   option   bit   can   be   employed  only  with  th=
e
              FUTEX_WAIT_BITSET and FUTEX_WAIT_REQUEUE_PI operations.

              If this option is set, the kernel  treats  timeout  as  a=
n
              absolute time based on CLOCK_REALTIME.

              If  this  option  is not set, the kernel treats timeout a=
s
              relative time, measured against the CLOCK_MONOTONIC clock=
=2E

       The operation specified in futex_op is one of the following:

       FUTEX_WAIT (since Linux 2.6.0)
              This operation tests that the  value  at  the  futex  wor=
d
              pointed  to  by  the  address  uaddr  still  contains  th=
e
              expected value val, and if so, then sleeps waiting  for  =
a
              FUTEX_WAKE  operation  on the futex word.  The load of th=
e
              value of the futex word is an atomic memory access  (i.e.=
,
              using atomic machine instructions of the respective archi=
=E2=80=90
              tecture).  This load, the  comparison  with  the  expecte=
d
              value,  and starting to sleep are performed atomically an=
d
              totally ordered with respect to other futex operations  o=
n
              the same futex word.  If the thread starts to sleep, it i=
s
              considered a waiter on this  futex  word.   If  the  fute=
x
              value  does not match val, then the call fails immediatel=
y
              with the error EAGAIN.

              The purpose of the comparison with the expected  value  i=
s
              to  prevent  lost wake-ups.  If another thread changed th=
e
              value of the futex word after the calling  thread  decide=
d
              to block based on the prior value, and if the other threa=
d
              executed a FUTEX_WAKE operation (or similar wake-up) afte=
r
              the  value  change  and  before this FUTEX_WAIT operation=
,
              then the latter will observe the value change and will no=
t
              start to sleep.

              If  the timeout argument is non-NULL, its contents specif=
y
              a relative timeout for the wait, measured according to th=
e
              CLOCK_MONOTONIC  clock.  (This interval will be rounded u=
p
              to the system clock granularity, and is guaranteed not  t=
o
              expire early.)  If timeout is NULL, the call blocks indef=
=E2=80=90
              initely.

              The arguments uaddr2 and val3 are ignored.


       FUTEX_WAKE (since Linux 2.6.0)
              This operation wakes at most val of the waiters  that  ar=
e
              waiting (e.g., inside FUTEX_WAIT) on the futex word at th=
e
              address uaddr.  Most commonly, val is specified as  eithe=
r
              1  (wake up a single waiter) or INT_MAX (wake up all wait=
=E2=80=90
              ers).  No guarantee is provided about  which  waiters  ar=
e
              awoken  (e.g.,  a waiter with a higher scheduling priorit=
y
              is not guaranteed to be awoken in preference to  a  waite=
r
              with a lower priority).

              The arguments timeout, uaddr2, and val3 are ignored.


       FUTEX_FD (from Linux 2.6.0 up to and including Linux 2.6.25)
              This  operation  creates a file descriptor that is associ=
=E2=80=90
              ated with the futex at uaddr.  The caller must  close  th=
e
              returned  file descriptor after use.  When another proces=
s
              or thread performs a FUTEX_WAKE on  the  futex  word,  th=
e
              file   descriptor   indicates   as   being  readable  wit=
h
              select(2), poll(2), and epoll(7)

              The file descriptor can be  used  to  obtain  asynchronou=
s
              notifications:  if  val  is  nonzero,  then,  when anothe=
r
              process or thread executes a FUTEX_WAKE, the  caller  wil=
l
              receive the signal number that was passed in val.

              The arguments timeout, uaddr2 and val3 are ignored.

              Because  it was inherently racy, FUTEX_FD has been remove=
d
              from Linux 2.6.26 onward.

       FUTEX_REQUEUE (since Linux 2.6.0)
              This operation performs the same task as FUTEX_CMP_REQUEU=
E
              (see  below), except that no check is made using the valu=
e
              in val3.  (The argument val3 is ignored.)

       FUTEX_CMP_REQUEUE (since Linux 2.6.7)
              This operation first checks  whether  the  location  uadd=
r
              still  contains  the  value  val3.   If not, the operatio=
n
              fails with the error  EAGAIN.   Otherwise,  the  operatio=
n
              wakes  up a maximum of val waiters that are waiting on th=
e
              futex at uaddr.  If there are more than val waiters,  the=
n
              the  remaining  waiters are removed from the wait queue o=
f
              the source futex at uaddr and added to the wait  queue  o=
f
              the  target  futex at uaddr2.  The val2 argument specifie=
s
              an upper limit on the number of waiters that are  requeue=
d
              to the futex at uaddr2.

              The  load  from  uaddr  is  an atomic memory access (i.e.=
,
              using atomic machine instructions of the respective archi=
=E2=80=90
              tecture).   This  load,  the comparison with val3, and th=
e
              requeueing of any waiters  are  performed  atomically  an=
d
              totally  ordered  with  respect to other operations on th=
e
              same futex word.

              Typical values to specify for val are 0 or or 1.   (Speci=
=E2=80=90
              fying  INT_MAX  is  not  useful, because it would make th=
e
              FUTEX_CMP_REQUEUE  operation  equivalent  to  FUTEX_WAKE.=
)
              The  limit  value specified via val2 is typically either =
1
              or INT_MAX.  (Specifying the argument as 0 is not  useful=
,
              because  it  would  make  the  FUTEX_CMP_REQUEUE operatio=
n
              equivalent to FUTEX_WAIT.)

              The FUTEX_CMP_REQUEUE operation was added as a replacemen=
t
              for the earlier FUTEX_REQUEUE.  The difference is that th=
e
              check of the value at uaddr can be  used  to  ensure  tha=
t
              requeueing  happens  only  under certain conditions, whic=
h
              allows race conditions to be avoided in certain use cases=
=2E

              Both FUTEX_REQUEUE and FUTEX_CMP_REQUEUE can  be  used  t=
o
              avoid  "thundering  herd"  wake-ups  that could occur whe=
n
              using FUTEX_WAKE in cases where all of  the  waiters  tha=
t
              are  woken  need  to  acquire another futex.  Consider th=
e
              following scenario,  where  multiple  waiter  threads  ar=
e
              waiting on B, a wait queue implemented using a futex:

                  lock(A)
                  while (!check_value(V)) {
                      unlock(A);
                      block_on(B);
                      lock(A);
                  };
                  unlock(A);

              If  a waker thread used FUTEX_WAKE, then all waiters wait=
=E2=80=90
              ing on B would be woken up, and they would would  all  tr=
y
              to  acquire lock A.  However, waking all of the threads i=
n
              this manner would be pointless because all except  one  o=
f
              the  threads  would immediately block on lock A again.  B=
y
              contrast, a requeue operation wakes just  one  waiter  an=
d
              moves  the  other  waiters  to  lock A, and when the woke=
n
              waiter unlocks A then the next waiter can proceed.

       FUTEX_WAKE_OP (since Linux 2.6.14)
              This operation was added to support  some  user-space  us=
e
              cases  where  more  than  one futex must be handled at th=
e
              same time.  The most notable example is the implementatio=
n
              of  pthread_cond_signal(3),  which  requires operations o=
n
              two futexes, the one used to implement the mutex  and  th=
e
              one  used  in the implementation of the wait queue associ=
=E2=80=90
              ated with the condition  variable.   FUTEX_WAKE_OP  allow=
s
              such cases to be implemented without leading to high rate=
s
              of contention and context switching.

              The FUTEX_WAIT_OP operation is equivalent to executing th=
e
              following code atomically and totally ordered with respec=
t
              to other futex operations on any of the two supplied fute=
x
              words:

                  int oldval =3D *(int *) uaddr2;
                  *(int *) uaddr2 =3D oldval op oparg;
                  futex(uaddr, FUTEX_WAKE, val, 0, 0, 0);
                  if (oldval cmp cmparg)
                      futex(uaddr2, FUTEX_WAKE, val2, 0, 0, 0);

              In other words, FUTEX_WAIT_OP does the following:

              *  saves  the  original  value of the futex word at uaddr=
2
                 and performs an operation to modify the  value  of  th=
e
                 futex  at  uaddr2;  this is an atomic read-modify-writ=
e
                 memory access (i.e., using atomic machine  instruction=
s
                 of the respective architecture)

              *  wakes  up a maximum of val waiters on the futex for th=
e
                 futex word at uaddr; and

              *  dependent on the results of  a  test  of  the  origina=
l
                 value  of  the futex word at uaddr2, wakes up a maximu=
m
                 of val2 waiters on the futex  for  the  futex  word  a=
t
                 uaddr2.

              The  operation and comparison that are to be performed ar=
e
              encoded in the bits of the  argument  val3.   Pictorially=
,
              the encoding is:

                      +---+---+-----------+-----------+
                      |op |cmp|   oparg   |  cmparg   |
                      +---+---+-----------+-----------+
                        4   4       12          12    <=3D=3D # of bits

              Expressed in code, the encoding is:

                  #define FUTEX_OP(op, oparg, cmp, cmparg) \
                                  (((op & 0xf) << 28) | \
                                  ((cmp & 0xf) << 24) | \
                                  ((oparg & 0xfff) << 12) | \
                                  (cmparg & 0xfff))

              In  the above, op and cmp are each one of the codes liste=
d
              below.   The  oparg  and  cmparg  components  are  litera=
l
              numeric values, except as noted below.

              The op component has one of the following values:

                  FUTEX_OP_SET        0  /* uaddr2 =3D oparg; */
                  FUTEX_OP_ADD        1  /* uaddr2 +=3D oparg; */
                  FUTEX_OP_OR         2  /* uaddr2 |=3D oparg; */
                  FUTEX_OP_ANDN       3  /* uaddr2 &=3D ~oparg; */
                  FUTEX_OP_XOR        4  /* uaddr2 ^=3D oparg; */

              In  addition,  bit-wise  ORing the following value into o=
p
              causes (1 << oparg) to be used as the operand:

                  FUTEX_OP_ARG_SHIFT  8  /* Use (1 << oparg) as operand=
 */

              The cmp field is one of the following:

                  FUTEX_OP_CMP_EQ     0  /* if (oldval =3D=3D cmparg) w=
ake */
                  FUTEX_OP_CMP_NE     1  /* if (oldval !=3D cmparg) wak=
e */
                  FUTEX_OP_CMP_LT     2  /* if (oldval < cmparg) wake *=
/
                  FUTEX_OP_CMP_LE     3  /* if (oldval <=3D cmparg) wak=
e */
                  FUTEX_OP_CMP_GT     4  /* if (oldval > cmparg) wake *=
/
                  FUTEX_OP_CMP_GE     5  /* if (oldval >=3D cmparg) wak=
e */

              The return value of FUTEX_WAKE_OP is the sum of the numbe=
r
              of  waiters  woken  on  the futex uaddr plus the number o=
f
              waiters woken on the futex uaddr2.

       FUTEX_WAIT_BITSET (since Linux 2.6.25)
              This operation is like FUTEX_WAIT except that val3 is use=
d
              to  provide a 32-bit bitset to the kernel.  This bitset i=
s
              stored in the kernel-internal state of  the  waiter.   Se=
e
              the description of FUTEX_WAKE_BITSET for further details.

              The  FUTEX_WAIT_BITSET operation also interprets the time=
=E2=80=90
              out argument differently from FUTEX_WAIT.  See the discus=
=E2=80=90
              sion of FUTEX_CLOCK_REALTIME, above.

              The uaddr2 argument is ignored.

       FUTEX_WAKE_BITSET (since Linux 2.6.25)
              This  operation  is the same as FUTEX_WAKE except that th=
e
              val3 argument is used to provide a 32-bit  bitset  to  th=
e
              kernel.   This  bitset  is  used  to  select which waiter=
s
              should be woken up.  The selection is done by  a  bit-wis=
e
              AND of the "wake" bitset (i.e., the value in val3) and th=
e
              bitset which is stored in the kernel-internal state of th=
e
              waiter    (the   "wait"   bitset   that   is   set   usin=
g
              FUTEX_WAIT_BITSET).  All of  the  waiters  for  which  th=
e
              result  of  the AND is nonzero are woken up; the remainin=
g
              waiters are left sleeping.

              The effect of FUTEX_WAIT_BITSET and  FUTEX_WAKE_BITSET  i=
s
              to  allow  selective  wake-ups among multiple waiters tha=
t
              are blocked  on  the  same  futex.   However,  note  that=
,
              depending  on  the  use case, employing this bitset multi=
=E2=80=90
              plexing feature on a futex can be less efficient than sim=
=E2=80=90
              ply  using multiple futexes, because employing bitset mul=
=E2=80=90
              tiplexing requires the kernel to check all  waiters  on  =
a
              futex,  including  those  that are not interested in bein=
g
              woken up (i.e., they do not have the relevant bit  set  i=
n
              their "wait" bitset).

              The uaddr2 and timeout arguments are ignored.

              The  FUTEX_WAIT  and  FUTEX_WAKE  operations correspond t=
o
              FUTEX_WAIT_BITSET and FUTEX_WAKE_BITSET  operations  wher=
e
              the bitsets are all ones.

   Priority-inheritance futexes
       Linux supports priority-inheritance (PI) futexes in order to han=
=E2=80=90
       dle priority-inversion problems that can be encountered with nor=
=E2=80=90
       mal  futex  locks.  Priority inversion is the problem that occur=
s
       when a high-priority task is blocked waiting to  acquire  a  loc=
k
       held  by a low-priority task, while tasks at an intermediate pri=
=E2=80=90
       ority continuously preempt the low-priority task  from  the  CPU=
=2E
       Consequently,  the  low-priority  task  makes  no progress towar=
d
       releasing the lock, and the high-priority task remains blocked.

       Priority inheritance is a mechanism for dealing with  the  prior=
=E2=80=90
       ity-inversion problem.  With this mechanism, when a high-priorit=
y
       task becomes blocked by a lock held by a low-priority  task,  th=
e
       priority  of  the low-priority task is temporarily raised to tha=
t
       of the high-priority task, so that it is  not  preempted  by  an=
y
       intermediate  level  tasks,  and  can  thus  make progress towar=
d
       releasing the lock.  To be effective, priority  inheritance  mus=
t
       be  transitive,  meaning that if a high-priority task blocks on =
a
       lock held by a lower-priority task that is itself  blocked  by  =
a
       lock  held  by another intermediate-priority task (and so on, fo=
r
       chains of arbitrary length), then both of those  tasks  (or  mor=
e
       generally,  all  of the tasks in a lock chain) have their priori=
=E2=80=90
       ties raised to be the same as the high-priority task.

       From a user-space perspective, what makes a futex PI-aware  is  =
a
       policy  agreement  (described  below)  between user space and th=
e
       kernel about the value of the futex word, coupled with the use o=
f
       the PI-futex operations described below.  (Unlike the other fute=
x
       operations described above, the PI-futex operations are  designe=
d
       for the implementation of very specific IPC mechanisms.)

       The  PI-futex  operations  described  below differ from the othe=
r
       futex operations in that they impose policy on  the  use  of  th=
e
       value of the futex word:

       *  If  the  lock is not acquired, the futex word's value shall b=
e
          0.

       *  If the lock is acquired, the futex word's value shall  be  th=
e
          thread ID (TID; see gettid(2)) of the owning thread.

       *  If  the lock is owned and there are threads contending for th=
e
          lock, then the FUTEX_WAITERS bit shall be  set  in  the  fute=
x
          word's value; in other words, this value is:

              FUTEX_WAITERS | TID


          (Note that is invalid for a PI futex word to have no owner an=
d
          FUTEX_WAITERS set.)

       With this policy in place, a user-space application  can  acquir=
e
       an  unacquired  lock  or release a lock using atomic instruction=
s
       executed in user mode (e.g., a compare-and-swap operation such a=
s
       cmpxchg  on  the x86 architecture).  Acquiring a lock simply con=
=E2=80=90
       sists of using  compare-and-swap  to  atomically  set  the  fute=
x
       word's  value  to  the  caller's TID if its previous value was 0=
=2E
       Releasing a lock requires using compare-and-swap to set the fute=
x
       word's value to 0 if the previous value was the expected TID.

       If a futex is already acquired (i.e., has a nonzero value), wait=
=E2=80=90
       ers must employ the FUTEX_LOCK_PI operation to acquire the  lock=
=2E
       If other threads are waiting for the lock, then the FUTEX_WAITER=
S
       bit is set in the futex value; in this case, the lock owner  mus=
t
       employ the FUTEX_UNLOCK_PI operation to release the lock.

       In  the  cases  where  callers  are forced into the kernel (i.e.=
,
       required to perform a futex() call), they then deal directly wit=
h
       a so-called RT-mutex, a kernel locking mechanism which implement=
s
       the required priority-inheritance semantics.  After the  RT-mute=
x
       is  acquired,  the futex value is updated accordingly, before th=
e
       calling thread returns to user space.

       It is important to note that the kernel  will  update  the  fute=
x
       word's  value  prior  to returning to user space.  (This prevent=
s
       the possibility of the futex word's value ending up in an invali=
d
       state,  such  as having an owner but the value being 0, or havin=
g
       waiters but not having the FUTEX_WAITERS bit set.)

       If a futex has an associated RT-mutex in the kernel (i.e.,  ther=
e
       are  blocked  waiters)  and  the owner of the futex/RT-mutex die=
s
       unexpectedly, then the kernel cleans up the RT-mutex and hands i=
t
       over  to  the  next waiter.  This in turn requires that the user=
-
       space value is updated accordingly.  To  indicate  that  this  i=
s
       required,  the  kernel sets the FUTEX_OWNER_DIED bit in the fute=
x
       word along with the thread ID of the new owner.   User  space  i=
s
       then responsible for cleaning up the stale state left over by th=
e
       dead owner.

       PI futexes are operated on by specifying one of the values liste=
d
       below  in  futex_op.   Note  that the PI futex operations must b=
e
       used as paired operations and  are  subject  to  some  additiona=
l
       requirements:

       *  FUTEX_LOCK_PI  and FUTEX_TRYLOCK_PI pair with FUTEX_UNLOCK_PI=
=2E
          FUTEX_UNLOCK_PI must be called only on a futex  owned  by  th=
e
          calling  thread, as defined by the value policy, otherwise th=
e
          error EPERM results.

       *  FUTEX_WAIT_REQUEUE_PI pairs with  FUTEX_CMP_REQUEUE_PI.   Thi=
s
          must  be  performed from a non-PI futex to a distinct PI fute=
x
          (or the error EINVAL results).  Additionally, val (the  numbe=
r
          of  waiters  to  be  woken)  must  be  1  (or the error EINVA=
L
          results).

       The PI futex operations are as follows:

       FUTEX_LOCK_PI (since Linux 2.6.18)
              This operation is used after after an attempt  to  acquir=
e
              the  lock  via  an  atomic  user-mode  instruction  faile=
d
              because the futex word has a  nonzero  value=E2=80=94spec=
ifically,
              because  it  contained the (PID-namespace-specific) TID o=
f
              the lock owner.

              The operation checks the value of the futex  word  at  th=
e
              address  uaddr.   If the value is 0, then the kernel trie=
s
              to atomically set the futex value to the caller's TID.  I=
f
              the  futex  word's value is nonzero, the kernel atomicall=
y
              sets the FUTEX_WAITERS bit, which signals the futex  owne=
r
              that  it  cannot unlock the futex in user space atomicall=
y
              by setting the futex value to 0.  After that, the kernel:

              1. Tries to find the thread which is associated  with  th=
e
                 owner TID.

              2. Creates  or reuses kernel state on behalf of the owner=
=2E
                 (If this is the first waiter, there is no kernel  stat=
e
                 for  this  futex, so kernel state is created by lockin=
g
                 the RT-mutex and the futex owner is made the  owner  o=
f
                 the  RT-mutex.  If there are existing waiters, then th=
e
                 existing state is reused.)

              3. Attaches the waiter to the futex (i.e., the  waiter  i=
s
                 enqueued on the RT-mutex waiter list).

              If  more  than  one  waiter  exists, the enqueueing of th=
e
              waiter is in descending priority order.  (For  informatio=
n
              on   priority   ordering,   see   the  discussion  of  th=
e
              SCHED_DEADLINE, SCHED_FIFO, and SCHED_RR scheduling  poli=
=E2=80=90
              cies in sched(7).)  The owner inherits either the waiter'=
s
              CPU bandwidth  (if  the  waiter  is  scheduled  under  th=
e
              SCHED_DEADLINE  policy)  or  the waiter's priority (if th=
e
              waiter is scheduled under the SCHED_RR or SCHED_FIFO  pol=
=E2=80=90
              icy).  This inheritance follows the lock chain in the cas=
e
              of nested locking and performs deadlock detection.

              The timeout argument  provides  a  timeout  for  the  loc=
k
              attempt.   It is interpreted as an absolute time, measure=
d
              against the CLOCK_REALTIME clock.  If timeout is NULL, th=
e
              operation will block indefinitely.

              The uaddr2, val, and val3 arguments are ignored.

       FUTEX_TRYLOCK_PI (since Linux 2.6.18)
              This operation tries to acquire the futex at uaddr.  It i=
s
              invoked when a user-space atomic acquire did  not  succee=
d
              because the futex word was not 0.


=46IXME(Next sentence) The wording "The trylock in kernel" below=20
needs clarification. Suggestions?

              The trylock in kernel might succeed because the futex wor=
d
              contains     stale     state     (FUTEX_WAITERS     and/o=
r
              FUTEX_OWNER_DIED).   This can happen when the owner of th=
e
              futex died.  User space cannot handle this condition in  =
a
              race-free  manner,  but  the  kernel  can  fix this up an=
d
              acquire the futex.

              The uaddr2, val, timeout, and val3 arguments are ignored.

       FUTEX_UNLOCK_PI (since Linux 2.6.18)
              This operation wakes the top priority waiter that is wait=
=E2=80=90
              ing  in FUTEX_LOCK_PI on the futex address provided by th=
e
              uaddr argument.

              This is called when the user-space value at  uaddr  canno=
t
              be changed atomically from a TID (of the owner) to 0.

              The uaddr2, val, timeout, and val3 arguments are ignored.

       FUTEX_CMP_REQUEUE_PI (since Linux 2.6.31)
              This operation is a PI-aware variant of FUTEX_CMP_REQUEUE=
=2E
              It    requeues    waiters    that    are    blocked    vi=
a
              FUTEX_WAIT_REQUEUE_PI  on uaddr from a non-PI source fute=
x
              (uaddr) to a PI target futex (uaddr2).

              As with FUTEX_CMP_REQUEUE, this operation wakes up a maxi=
=E2=80=90
              mum of val waiters that are waiting on the futex at uaddr=
=2E
              However, for FUTEX_CMP_REQUEUE_PI, val is required to be =
1
              (since the main point is to avoid a thundering herd).  Th=
e
              remaining waiters are removed from the wait queue  of  th=
e
              source  futex  at uaddr and added to the wait queue of th=
e
              target futex at uaddr2.

              The val2 and val3 arguments serve the same purposes as fo=
r
              FUTEX_CMP_REQUEUE.

       FUTEX_WAIT_REQUEUE_PI (since Linux 2.6.31)
              Wait  on  a  non-PI  futex  at  uaddr  and  potentially b=
e
              requeued (via a FUTEX_CMP_REQUEUE_PI operation in  anothe=
r
              task)  onto  a  PI futex at uaddr2.  The wait operation o=
n
              uaddr is the same as for FUTEX_WAIT.

              The waiter can be removed from the wait on  uaddr  withou=
t
              requeueing on uaddr2 via a FUTEX_WAKE operation in anothe=
r
              task.  In this case, the  FUTEX_WAIT_REQUEUE_PI  operatio=
n
              returns with the error EWOULDBLOCK.

              If  timeout  is  not  NULL, it specifies a timeout for th=
e
              wait operation; this timeout is  interpreted  as  outline=
d
              above  in  the  description  of  the  FUTEX_CLOCK_REALTIM=
E
              option.  If timeout  is  NULL,  the  operation  can  bloc=
k
              indefinitely.

              The val3 argument is ignored.

              The  FUTEX_WAIT_REQUEUE_PI  and  FUTEX_CMP_REQUEUE_PI wer=
e
              added to support a fairly specific use case:  support  fo=
r
              priority-inheritance-aware  POSIX  threads condition vari=
=E2=80=90
              ables.  The idea is that these operations should always b=
e
              paired,  in order to ensure that user space and the kerne=
l
              remain in sync.  Thus, in the FUTEX_WAIT_REQUEUE_PI opera=
=E2=80=90
              tion,  the user-space application pre-specifies the targe=
t
              of   the    requeue    that    takes    place    in    th=
e
              FUTEX_CMP_REQUEUE_PI operation.

   RETURN VALUE
       In  the  event of an error (and assuming that futex() was invoke=
d
       via syscall(2)), all operations return -1 and set errno to  indi=
=E2=80=90
       cate the cause of the error.

       The  return  value  on  success  depends  on  the  operation,  a=
s
       described in the following list:

       FUTEX_WAIT
              Returns 0 if the caller was woken up.  Note that a wake-u=
p
              can also be caused by common futex usage patterns in unre=
=E2=80=90
              lated code that happened to have previously used the fute=
x
              word's  memory  location (e.g., typical futex-based imple=
=E2=80=90
              mentations of Pthreads mutexes can cause this  under  som=
e
              conditions).   Therefore,  callers should always conserva=
=E2=80=90
              tively assume that a return value of 0 can mean a spuriou=
s
              wake-up,  and  use  the futex word's value (i.e., the use=
r
              space synchronization scheme)
                  to decide whether to continue to block or not.

       FUTEX_WAKE
              Returns the number of waiters that were woken up.

       FUTEX_FD
              Returns the new file descriptor associated with the futex=
=2E

       FUTEX_REQUEUE
              Returns the number of waiters that were woken up.

       FUTEX_CMP_REQUEUE
              Returns the total number of waiters that were woken up  o=
r
              requeued  to  the  futex for the futex word at uaddr2.  I=
f
              this value is greater than val, then the difference is th=
e
              number of waiters requeued to the futex for the futex wor=
d
              at uaddr2.

       FUTEX_WAKE_OP
              Returns the total number of waiters that  were  woken  up=
=2E
              This  is  the  sum of the woken waiters on the two futexe=
s
              for the futex words at uaddr and uaddr2.

       FUTEX_WAIT_BITSET
              Returns 0 if the caller was woken up.  See FUTEX_WAIT  fo=
r
              how to interpret this correctly in practice.

       FUTEX_WAKE_BITSET
              Returns the number of waiters that were woken up.

       FUTEX_LOCK_PI
              Returns 0 if the futex was successfully locked.

       FUTEX_TRYLOCK_PI
              Returns 0 if the futex was successfully locked.

       FUTEX_UNLOCK_PI
              Returns 0 if the futex was successfully unlocked.

       FUTEX_CMP_REQUEUE_PI
              Returns  the total number of waiters that were woken up o=
r
              requeued to the futex for the futex word  at  uaddr2.   I=
f
              this  value  is  greater  than val, then difference is th=
e
              number of waiters requeued to the futex for the futex wor=
d
              at uaddr2.

       FUTEX_WAIT_REQUEUE_PI
              Returns  0  if the caller was successfully requeued to th=
e
              futex for the futex word at uaddr2.

   ERRORS
       EACCES No read access to the memory of a futex word.

       EAGAIN (FUTEX_WAIT, FUTEX_WAIT_BITSET, FUTEX_WAIT_REQUEUE_PI) Th=
e
              value  pointed  to  by uaddr was not equal to the expecte=
d
              value val at the time of the call.

              Note: on Linux, the symbolic names EAGAIN and  EWOULDBLOC=
K
              (both  of  which  appear  in different parts of the kerne=
l
              futex code) have the same value.

       EAGAIN (FUTEX_CMP_REQUEUE,   FUTEX_CMP_REQUEUE_PI)   The    valu=
e
              pointed  to  by  uaddr  is not equal to the expected valu=
e
              val3.

       EAGAIN (FUTEX_LOCK_PI,  FUTEX_TRYLOCK_PI,   FUTEX_CMP_REQUEUE_PI=
)
              The    futex    owner    thread    ID    of   uaddr   (fo=
r
              FUTEX_CMP_REQUEUE_PI: uaddr2) is about to  exit,  but  ha=
s
              not yet handled the internal state cleanup.  Try again.

       EDEADLK
              (FUTEX_LOCK_PI,   FUTEX_TRYLOCK_PI,  FUTEX_CMP_REQUEUE_PI=
)
              The futex word at uaddr is already locked by the caller.

       EDEADLK
              (FUTEX_CMP_REQUEUE_PI) While requeueing a waiter to the P=
I
              futex  for the futex word at uaddr2, the kernel detected =
a
              deadlock.

       EFAULT A required pointer argument (i.e., uaddr, uaddr2, or time=
=E2=80=90
              out) did not point to a valid user-space address.

       EINTR  A  FUTEX_WAIT  or  FUTEX_WAIT_BITSET  operation was inter=
=E2=80=90
              rupted by a signal (see  signal(7)).   In  kernels  befor=
e
              Linux  2.6.22,  this error could also be returned for on =
a
              spurious wakeup; since Linux 2.6.22, this no  longer  hap=
=E2=80=90
              pens.

       EINVAL The  operation  in futex_op is one of those that employs =
a
              timeout, but the supplied  timeout  argument  was  invali=
d
              (tv_sec  was  less than zero, or tv_nsec was not less tha=
n
              1,000,000,000).

       EINVAL The operation specified in futex_op employs one or both o=
f
              the  pointers  uaddr and uaddr2, but one of these does no=
t
              point to a valid object=E2=80=94that is, the address is n=
ot  four-
              byte-aligned.

       EINVAL (FUTEX_WAIT_BITSET, FUTEX_WAKE_BITSET) The bitset supplie=
d
              in val3 is zero.

       EINVAL (FUTEX_CMP_REQUEUE_PI)  uaddr  equals  uaddr2  (i.e.,   a=
n
              attempt was made to requeue to the same futex).

       EINVAL (FUTEX_FD) The signal number supplied in val is invalid.

       EINVAL (FUTEX_WAKE,       FUTEX_WAKE_OP,       FUTEX_WAKE_BITSET=
,
              FUTEX_REQUEUE, FUTEX_CMP_REQUEUE) The kernel  detected  a=
n
              inconsistency  between  the  user-space state at uaddr an=
d
              the kernel state=E2=80=94that is, it detected a waiter wh=
ich waits
              in FUTEX_LOCK_PI on uaddr.

       EINVAL (FUTEX_LOCK_PI,   FUTEX_TRYLOCK_PI,  FUTEX_UNLOCK_PI)  Th=
e
              kernel detected an inconsistency  between  the  user-spac=
e
              state  at  uaddr  and  the  kernel  state.  This indicate=
s
              either state corruption or that the kernel found a  waite=
r
              on    uaddr   which   is   waiting   via   FUTEX_WAIT   o=
r
              FUTEX_WAIT_BITSET.

       EINVAL (FUTEX_CMP_REQUEUE_PI) The kernel  detected  an  inconsis=
=E2=80=90
              tency  between the user-space state at uaddr2 and the ker=
=E2=80=90
              nel state; that is, the kernel  detected  a  waiter  whic=
h
              waits via FUTEX_WAIT or FUTEX_WAIT_BITSET on uaddr2.

       EINVAL (FUTEX_CMP_REQUEUE_PI)  The  kernel  detected an inconsis=
=E2=80=90
              tency between the user-space state at uaddr and the kerne=
l
              state;  that  is, the kernel detected a waiter which wait=
s
              via FUTEX_WAIT or FUTEX_WAIT_BITESET on uaddr.

       EINVAL (FUTEX_CMP_REQUEUE_PI) The kernel  detected  an  inconsis=
=E2=80=90
              tency between the user-space state at uaddr and the kerne=
l
              state; that is, the kernel detected a waiter  which  wait=
s
              on     uaddr     via     FUTEX_LOCK_PI     (instead     o=
f
              FUTEX_WAIT_REQUEUE_PI).

       EINVAL (FUTEX_CMP_REQUEUE_PI) An attempt was made  to  requeue  =
a
              waiter  to a futex other than that specified by the match=
=E2=80=90
              ing FUTEX_WAIT_REQUEUE_PI call for that waiter.

       EINVAL (FUTEX_CMP_REQUEUE_PI) The val argument is not 1.

       EINVAL Invalid argument.

       ENOMEM (FUTEX_LOCK_PI,  FUTEX_TRYLOCK_PI,   FUTEX_CMP_REQUEUE_PI=
)
              The  kernel could not allocate memory to hold state infor=
=E2=80=90
              mation.

       ENFILE (FUTEX_FD) The system limit on the total  number  of  ope=
n
              files has been reached.

       ENOSYS Invalid operation specified in futex_op.

       ENOSYS The FUTEX_CLOCK_REALTIME option was specified in futex_op=
,
              but the accompanying operation was neither FUTEX_WAIT_BIT=
=E2=80=90
              SET nor FUTEX_WAIT_REQUEUE_PI.

       ENOSYS (FUTEX_LOCK_PI,     FUTEX_TRYLOCK_PI,     FUTEX_UNLOCK_PI=
,
              FUTEX_CMP_REQUEUE_PI,  FUTEX_WAIT_REQUEUE_PI)  A  run-tim=
e
              check determined that the operation is not available.  Th=
e
              PI-futex operations are not implemented on  all  architec=
=E2=80=90
              tures and are not supported on some CPU variants.

       EPERM  (FUTEX_LOCK_PI,   FUTEX_TRYLOCK_PI,  FUTEX_CMP_REQUEUE_PI=
)
              The caller is not allowed to attach itself to the futex a=
t
              uaddr  (for  FUTEX_CMP_REQUEUE_PI:  the  futex at uaddr2)=
=2E
              (This may be caused by a state corruption in user space.)

       EPERM  (FUTEX_UNLOCK_PI) The caller does not own the lock  repre=
=E2=80=90
              sented by the futex word.

       ESRCH  (FUTEX_LOCK_PI,   FUTEX_TRYLOCK_PI,  FUTEX_CMP_REQUEUE_PI=
)
              The thread ID in the futex word at uaddr does not exist.

       ESRCH  (FUTEX_CMP_REQUEUE_PI) The thread ID in the futex word  a=
t
              uaddr2 does not exist.

       ETIMEDOUT
              The  operation  in futex_op employed the timeout specifie=
d
              in timeout, and the timeout expired before  the  operatio=
n
              completed.

   VERSIONS
       Futexes were first made available in a stable kernel release wit=
h
       Linux 2.6.0.

       Initial futex support was merged in Linux 2.5.7 but with  differ=
=E2=80=90
       ent  semantics  from  what  was described above.  A four-argumen=
t
       system call with the semantics described in this page was  intro=
=E2=80=90
       duced  in  Linux  2.5.40.   A  fifth  argument was added in Linu=
x
       2.5.70, and a sixth argument was added in Linux 2.6.7.

   CONFORMING TO
       This system call is Linux-specific.

   NOTES
       Glibc does not provide a wrapper for this system  call;  call  i=
t
       using syscall(2).

       Several higher-level programming abstractions are implemented vi=
a
       futexes, including POSIX semaphores  and  various  POSIX  thread=
s
       synchronization  mechanisms  (mutexes, condition variables, read=
-
       write locks, and barriers).

   EXAMPLE

=46IXME I think it would be helpful here to say a few more words about
      the difference(s) between FUTEX_LOCK_PI and FUTEX_TRYLOCK_PI.
      Can someone propose something?

       The program below demonstrates use of futexes in a program  wher=
e
       parent  and  child  use a pair of futexes located inside a share=
d
       anonymous mapping to synchronize access to a shared resource: th=
e
       terminal.   The  two  processes each write nloops (a command-lin=
e
       argument that defaults to 5 if omitted) messages to the  termina=
l
       and  employ  a  synchronization  protocol  that ensures that the=
y
       alternate in writing messages.  Upon running this program we  se=
e
       output such as the following:

           $ ./futex_demo
           Parent (18534) 0
           Child  (18535) 0
           Parent (18534) 1
           Child  (18535) 1
           Parent (18534) 2
           Child  (18535) 2
           Parent (18534) 3
           Child  (18535) 3
           Parent (18534) 4
           Child  (18535) 4

   Program source

       /* futex_demo.c

          Usage: futex_demo [nloops]
                           (Default: 5)

          Demonstrate the use of futexes in a program where parent and =
child
          use a pair of futexes located inside a shared anonymous mappi=
ng to
          synchronize access to a shared resource: the terminal. The tw=
o
          processes each write 'num-loops' messages to the terminal and=
 employ
          a synchronization protocol that ensures that they alternate i=
n
          writing messages.
       */
       #define _GNU_SOURCE
       #include <stdio.h>
       #include <errno.h>
       #include <stdlib.h>
       #include <unistd.h>
       #include <sys/wait.h>
       #include <sys/mman.h>
       #include <sys/syscall.h>
       #include <linux/futex.h>
       #include <sys/time.h>

       #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
                               } while (0)

       static int *futex1, *futex2, *iaddr;

       static int
       futex(int *uaddr, int futex_op, int val,
             const struct timespec *timeout, int *uaddr2, int val3)
       {
           return syscall(SYS_futex, uaddr, futex_op, val,
                          timeout, uaddr, val3);
       }

       /* Acquire the futex pointed to by 'futexp': wait for its value =
to
          become 1, and then set the value to 0. */

       static void
       fwait(int *futexp)
       {
           int s;

           /* __sync_bool_compare_and_swap(ptr, oldval, newval) is a gc=
c
              built-in function.  It atomically performs the equivalent=
 of:

                  if (*ptr =3D=3D oldval)
                      *ptr =3D newval;

              It returns true if the test yielded true and *ptr was upd=
ated.
              The alternative here would be to employ the equivalent at=
omic
              machine-language instructions.  For further information, =
see
              the GCC Manual. */

           while (1) {

               /* Is the futex available? */

               if (__sync_bool_compare_and_swap(futexp, 1, 0))
                   break;      /* Yes */

               /* Futex is not available; wait */

               s =3D futex(futexp, FUTEX_WAIT, 0, NULL, NULL, 0);
               if (s =3D=3D -1 && errno !=3D EAGAIN)
                   errExit("futex-FUTEX_WAIT");
           }
       }

       /* Release the futex pointed to by 'futexp': if the futex curren=
tly
          has the value 0, set its value to 1 and the wake any futex wa=
iters,
          so that if the peer is blocked in fpost(), it can proceed. */

       static void
       fpost(int *futexp)
       {
           int s;

           /* __sync_bool_compare_and_swap() was described in comments =
above */

           if (__sync_bool_compare_and_swap(futexp, 0, 1)) {

               s =3D futex(futexp, FUTEX_WAKE, 1, NULL, NULL, 0);
               if (s  =3D=3D -1)
                   errExit("futex-FUTEX_WAKE");
           }
       }

       int
       main(int argc, char *argv[])
       {
           pid_t childPid;
           int j, nloops;

           setbuf(stdout, NULL);

           nloops =3D (argc > 1) ? atoi(argv[1]) : 5;

           /* Create a shared anonymous mapping that will hold the fute=
xes.
              Since the futexes are being shared between processes, we
              subsequently use the "shared" futex operations (i.e., not=
 the
              ones suffixed "_PRIVATE") */

           iaddr =3D mmap(NULL, sizeof(int) * 2, PROT_READ | PROT_WRITE=
,
                       MAP_ANONYMOUS | MAP_SHARED, -1, 0);
           if (iaddr =3D=3D MAP_FAILED)
               errExit("mmap");

           futex1 =3D &iaddr[0];
           futex2 =3D &iaddr[1];

           *futex1 =3D 0;        /* State: unavailable */
           *futex2 =3D 1;        /* State: available */

           /* Create a child process that inherits the shared anonymous
              mapping */

           childPid =3D fork();
           if (childPid =3D=3D -1)
               errExit("fork");

           if (childPid =3D=3D 0) {        /* Child */
               for (j =3D 0; j < nloops; j++) {
                   fwait(futex1);
                   printf("Child  (%ld) %d\n", (long) getpid(), j);
                   fpost(futex2);
               }

               exit(EXIT_SUCCESS);
           }

           /* Parent falls through to here */

           for (j =3D 0; j < nloops; j++) {
               fwait(futex2);
               printf("Parent (%ld) %d\n", (long) getpid(), j);
               fpost(futex1);
           }

           wait(NULL);

           exit(EXIT_SUCCESS);
       }

   SEE ALSO
       get_robust_list(2), restart_syscall(2), pthread_mutexattr_getpro=
=E2=80=90
       tocol(3), futex(7), sched(7)

       The following kernel source files:

       * Documentation/pi-futex.txt

       * Documentation/futex-requeue-pi.txt

       * Documentation/locking/rt-mutex.txt

       * Documentation/locking/rt-mutex-design.txt

       * Documentation/robust-futex-ABI.txt

       Franke, H., Russell, R., and Kirwood, M., 2002.  Fuss, Futexes
       and Furwocks: Fast Userlevel Locking in Linux (from proceedings
       of the Ottawa Linux Symposium 2002),
       =E2=9F=A8http://kernel.org/doc/ols/2002/ols2002-pages-479-495.pd=
f=E2=9F=A9

       Hart, D., 2009. A futex overview and update,
       =E2=9F=A8http://lwn.net/Articles/360699/=E2=9F=A9

       Hart, D. and Guniguntala, D., 2009.  Requeue-PI: Making Glibc
       Condvars PI-Aware (from proceedings of the 2009 Real-Time Linux
       Workshop),
       =E2=9F=A8http://lwn.net/images/conf/rtlws11/papers/proc/p10.pdf=E2=
=9F=A9

       Drepper, U., 2011. Futexes Are Tricky,
       =E2=9F=A8http://www.akkadia.org/drepper/futex.pdf=E2=9F=A9

       Futex example library, futex-*.tar.bz2 at
       =E2=9F=A8ftp://ftp.kernel.org/pub/linux/kernel/people/rusty/=E2=9F=
=A9


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
