From: Michael Kerrisk <mtk-ASgREoAs3yw@public.gmane.org>
Subject: Revised keyrings(7) man page for review
Date: Fri, 4 Nov 2016 16:47:16 +0100
Message-ID: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------938A9A6E7B0A9D0B80F45E20"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------938A9A6E7B0A9D0B80F45E20
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi David,

As part of the process of adopting the *.7 pages from
keyutils into man-pages, I've made some significant
extensions to the keyrings(7) page. Among the more notable 
changes:

* Expanded the detail in "Key types"
* Addition of a section on the various /proc files
* Various other minor reworkings elsewhere in the text

Would you would be willing to review the new page, please?
(The page source file is attached, in case you want to
see all the formatting.)

Cheers,

Michael


====

NAME
       keyrings - in-kernel key management and retention facility

DESCRIPTION
       The  Linux key-management facility is primarily a way for driv‐
       ers to retain or  cache  security  data,  authentication  keys,
       encryption keys, and other data in the kernel.

       System call interfaces are provided so that user-space programs
       can manage those objects and also use the  facility  for  their
       own purposes.

       A  library  and some user-space utilities are provided to allow
       access to the facility.  See keyctl(1),  keyctl(3),  and  keyu‐
       tils(7) for more information.

   Keys
       A key has the following attributes:

       Serial number (ID)
              This  is  a  unique  integer  handle  by  which a key is
              referred to in system call arguments.  The serial number
              is  sometimes synonymously referred as the key ID.  Pro‐
              grammatically, key serial numbers are represented  using
              the type key_serial_t.

       Type   A  key's  type  defines what sort of data can be held in
              the key, how the proposed content of  the  key  will  be
              parsed, and how the payload will be used.

              There  are  a number of general purpose types available,
              plus some specialist types defined by specific drivers.

       Description (name)
              The key description is a printable string that  is  used
              as  the search term for the key (in conjunction with the
              key type) as well as a display name.   During  searches,
              the  description  may  be  partially  matched or exactly
              matched.

       Payload (data)
              The payload is the actual content of  a  key.   This  is
              usually  set  when  a key is created, but it is possible
              for the kernel to upcall to user  space  to  finish  the
              instantiation  of a key if that key wasn't already known
              to the kernel when it was requested.   (Details  can  be
              found in request_key(2).)

              A  key's payload can be read and updated if the key type
              supports it and if suitable permission is granted to the
              caller.

       Access rights
              Much  as  files  do,  each key has an owning user ID, an
              owning group ID, and a security label.  They also have a
              set  of  permissions,  though  there are more than for a
              normal UNIX file, and there is  an  additional  category
              beyond the usual user, group, and other (see below).

              Note that keys are quota controlled since they represent
              unswappable kernel memory and the owning user ID  speci‐
              fies whose quota is to be debited.

       Expiration time
              Each  key  can  have  an expiration time set.  When that
              time is reached, the key is marked as being expired  and
              accesses  to  it fail with EKEYEXPIRED.  If not deleted,
              updated, or  replaced,  after  a  set  amount  of  time,
              expired  keys  are  automatically removed along with all
              links to them, and attempts to access the key will  fail
              with the error ENOKEY.

       Reference count
              Each  key has a reference count.  Keys are referenced by
              keyrings, by currently active users, and by a  process's
              credentials.  When the reference count reaches zero, the
              key is scheduled for garbage collection.

   Key types
       The facility provides several basic types of key:

       "user" This is a general purpose key type.   The  key  is  kept
              entirely  within kernel memory.  The payload may be read
              and updated by user-space applications.

              The payload for keys of this type is a blob of arbitrary
              data of up to 32,767 bytes.

              The  description  may  be any valid string, though it is
              preferred that it start with  a  colon-delimited  prefix
              representing the service to which the key is of interest
              (for instance "afs:mykey").

       "keyring"
              Keyrings are special keys whose payload  consists  of  a
              set  of  links to other keys (including other keyrings),
              analogous to a directory holding links  to  files.   The
              main  purpose of a keyring is to prevent other keys from
              being garbage collected because nothing refers to them.

       "logon" (since Linux 3.3)
              This key type is essentially the same as "user", but  it
              does   not   provide   reading   (i.e.,   the  keyctl(2)
              KEYCTL_READ operation), meaning that the key payload  is
              never  visible  from  user  space.  This is suitable for
              storing username-password pairs that you do not want  to
              be readable from user space.

       "big_key" (since Linux 3.13)
              This  key type is similar to the "user" key type, but it
              may hold a payload of up to 1MiB in size.  The data  may
              be stored in the swap space rather than in kernel memory
              if the data size exceeds the  overhead  of  storing  the
              data in swap space (a tmpfs file is used, which requires
              filesystem structures to be allocated  in  the  kernel).
              This  key  type is useful for tasks such as holding Ker‐
              beros ticket caches.

       There are  more  specialized  key  types  available  also,  but
       they're  not  discussed here as they're not intended for normal
       user-space use.

   Keyrings
       As previously mentioned, keyrings are a  special  type  of  key
       that  contain  links  to  other  keys  (which may include other
       keyrings).   Keys  may  be  linked  to  by  multiple  keyrings.
       Keyrings  may  be  considered  as analogous to UNIX directories
       where each directory contains a set of hard links to files.

       Various operations  (system  calls)  may  be  applied  only  to
       keyrings:

       Adding A  key  may  be  added to a keyring by system calls that
              create keys.  This prevents the new key from being imme‐
              diately deleted when the system call driver releases its
              last reference to the key.

       Linking
              A link may be added to a keyring pointing to a key  that
              is  already known, provided this does not create a self-
              referential cycle.

       Unlinking
              A link may be removed from a  keyring.   When  the  last
              link to a key is removed, that key will be scheduled for
              deletion by the garbage collector.

       Clearing
              All the links may be removed from a keyring.

       Searching
              A keyring may be considered the root of a tree  or  sub‐
              tree  in  which  keyrings  form  the  branches  and non-
              keyrings the leaves.  This tree may be  searched  for  a
              leaf matching a particular type and description.

       See   keyctl_clear(3),  keyctl_link(3),  keyctl_search(3),  and
       keyctl_unlink(3) for more information.

   Anchoring keys
       To prevent a key from being prematurely garbage  collected,  it
       must  anchored  to keep its reference count elevated when it is
       not in active use by the kernel.

       Keyrings are used to anchor other keys - each link is a  refer‐
       ence  on  a  key - but whilst keyrings are available to link to
       keys, keyrings themselves are just keys and are also subject to
       the same anchoring necessity.

       The  kernel  makes available a number of anchor keyrings.  Note
       that some of these keyrings will be  created  only  when  first
       accessed.

       Process keyrings
              Process  credentials  themselves reference keyrings with
              specific semantics.  These keyrings are pinned  as  long
              as  the  set  of credentials exists, which is usually as
              long as the process exists.

              There  are  three  keyrings   with   different   inheri‐
              tance/sharing  rules:  The session-keyring(7) (inherited
              and  shared  by  all  child  processes),  the   process-
              keyring(7)  (shared by all threads in a process) and the
              thread-keyring(7) (specific to a particular thread).

       User keyrings
              Each UID known to the kernel has a record that  contains
              two  keyrings: the user-keyring(7) and the user-session-
              keyring(7).  These exist for as long as the  UID  record
              in  the  kernel  exists.   A link to the user keyring is
              placed in a new session keyring by pam_keyinit(8) when a
              new login session is initiated.

       Persistent keyrings
              There  is  a persistent-keyring(7) available to each UID
              known to the system.  It may persist beyond the life  of
              the  UID record previously mentioned, but has an expira‐
              tion time set such that it is automatically  cleaned  up
              after  a  set  time.   This,  for  example, permits cron
              scripts to use credentials left when the user logs out.

              Note that the expiration time is reset  every  time  the
              persistent key is requested.

       Special keyrings
              There  are special keyrings owned by the kernel that can
              anchor keys for special purposes.  An example of this is
              the  system keyring used for holding encryption keys for
              module signature verification.

              These special keyrings  are  usually  closed  to  direct
              alteration by user space.

       See  thread-keyring(7), process-keyring(7), session-keyring(7),
       user-keyring(7),   user-session-keyring(7),   and   persistent-
       keyring(7) for more information.

   Possession
       The  concept  of  possession  is important to understanding the
       keyrings security model.  Whether a thread possesses a  key  is
       determined by the following rules:

       (1) Any key or keyring that does not grant search permission to
           the caller is ignored in all the following rules.

       (2) A  thread  possesses  its  session,  process,  and   thread
           keyrings  directly because those are pointed to by its cre‐
           dentials.

       (3) If a keyring is possessed, then any key it links to is also
           possessed.

       (4) If  any  key  a  keyring links to is itself a keyring, then
           rule (3) applies recursively.

       (5) If a process is upcalled from the kernel to  instantiate  a
           key,  then it also possesses the requester's keyrings as in
           rule (1) as if it were the requester.

       Note that possession is not a fundamental property  of  a  key,
       but must rather be calculated each time the key is needed.

       Possession  is designed to allow set-user-ID programs run from,
       say a user's shell to access the user's keys.  It  also  allows
       the  prevention  of access to keys just on the basis of UID and
       GID matches.

       When it creates the session keyring, pam_keyinit(8) adds a link
       to  the  user-keyring(7), thus making the user keyring and any‐
       thing it contains possessed by default.

   Access rights
       Each key has the following security-related attributes:

       *  The owning user ID

       *  The ID of a group that is permitted to access the key

       *  A security label

       *  A permissions mask

       The permissions mask contains four sets of rights.   The  first
       three sets are mutually exclusive.  One and only one will be in
       force for a particular access check.  In  order  of  descending
       priority, these three sets are:

       user   The  set  specifies the rights granted if the key's user
              ID matches the caller's filesystem user ID.

       group  The set specifies the rights  granted  if  the  user  ID
              didn't match and the key's group ID matches the caller's
              filesystem GID or  one  of  the  caller's  supplementary
              group IDs.

       other  The  set  specifies  the  rights  granted if neither the
              key's user ID nor group ID matched.

       The fourth set of rights is:

       possessor
              The set specifies the rights granted if a key is  deter‐
              mined to be possessed by the caller.

       The  complete set of rights for a key is the union of whichever
       of the first three sets is applicable plus the  fourth  set  if
       the key is possessed.

       The set of rights that may be granted in each of the four masks
       is as follows:

       view   The attributes of the key may be  read.   This  includes
              the  type, description, and access rights (excluding the
              security label).

       read   For a key: the payload of the key may be  read.   For  a
              keyring:  the list of serial numbers (keys) to which the
              keyring has links may be read.

       write  The payload of the key may be updated.  For  a  keyring,
              links  may  be added to or removed from the keyring, the
              keyring  may  be  cleared  completely  (all  links   are
              removed), and the key may be revoked.

       search For  a  key  (or  a  keyring): the key may be found by a
              search.  For a  keyring:  keys  and  keyrings  that  are
              linked to by the keyring may be searched.

       link   Links may be created from keyrings to the key.  The ini‐
              tial link to a key that is established when the  key  is
              created doesn't require this permission.

       setattr
              The  ownership details and security label of the key may
              be changed, the key's expiration time may  be  set,  and
              the key may be revoked.

       If any right is granted to a thread for a key,


       ┌─────────────────────────────────────────────────────┐
       │FIXME                                                │
       ├─────────────────────────────────────────────────────┤
       │This  seems to contradict the text below, which says │
       │that 'view' permission is what is significant.       │
       │Which is correct?                                    │
       └─────────────────────────────────────────────────────┘
       then that thread will see the key listed in /proc/keys.  If  no
       rights  at  all  are  granted, then that thread can't even tell
       that the key exists.

       In addition to access rights, any active Linux Security  Module
       (LSM) may prevent access to a key if its policy so dictates.  A
       key may be given a security label or other attribute by the LSM
       which can be retrieved.

       See   keyctl_chown(3),   keyctl_describe(3),   keyctl_get_secu‐
       rity(3), keyctl_setperm(3), and selinux(8)  for  more  informa‐
       tion.

   Searching for keys
       One of the key features of the Linux key-management facility is
       the ability to find a key that a  process  is  retaining.   The
       request_key(2)  system  call is the primary point of access for
       user-space applications to find a key.  (internally, the kernel
       has  something similar available for use by internal components
       that make use of keys.)

       The search algorithm works as follows:

       (1) The three process keyrings are searched  in  the  following
           order:  the  thread  thread-keyring(7)  if  it  exists, the
           process-keyring(7) if it exists, and then either  the  ses‐
           sion-keyring(7) if it exists or the user-session-keyring(7)
           if that exists.

       (2) If the caller  was  a  process  that  was  invoked  by  the
           request_key(2)  upcall  mechanism  then the keyrings of the
           original caller of that request_key(2) will be searched  as
           well.

       (3) The search of the keyring tree is in preorder: each keyring
           is searched first for a match, then the  keyrings  referred
           to by that keyring are searched.

       (4) If  a  matching key is found that is valid, then the search
           terminates and that key is returned.

       (5) If a  matching  key  is  found  that  has  an  error  state
           attached,  that error state is noted and the search contin‐
           ues.

       (6) If valid matching key is found, then the first noted  error
           state is returned; otherwise, an ENOKEY error is returned.

       It is also possible to search a specific keyring, in which case
       only steps (3) to (6) apply.

       See request_key(2) and keyctl_search(3) for more information.

   On-demand key creation
       If a key cannot be found, request_key(2) will, if given a call‐
       out_info  argument,  create  a  new key and then upcall to user
       space to instantiate the key.  This allows keys to  be  created
       on an as-needed basis.

       Typically,  this  will  involve the kernel forking and exec'ing
       the request-key(8) program, which will then execute the  appro‐
       priate handler based on its configuration.

       The  handler  is passed a special authorization key that allows
       it and only it to instantiate the new key.  This is  also  used
       to  permit  searches  performed  by the handler program to also
       search the requester's keyrings.

       See request_key(2), keyctl_assume_authority(3),  keyctl_instan‐
       tiate(3),  keyctl_negate(3),  keyctl_reject(3),  request-key(8)
       and request-key.conf(5) for more information.

   /proc files
       The kernel provides various /proc files that expose information
       about keys or define limits on key usage.

       /proc/keys (since Linux 2.6.10)
              This  file  exposes a list of the keys that are viewable
              by the reading process,  providing  various  information
              about each key.

              The  only keys included in the list are those that grant
              view permission to the reading  process,  regardless  of
              whether  or  not it possesses them.  LSM security checks
              are still performed, and may  filter  out  further  keys
              that the process is not authorized to view.

              An  example  of the data that one might see in this file
              is the following:

009a2028 I--Q---   1 perm 3f010000  1000  1000 user     krb_ccache:primary: 12
1806c4ba I--Q---   1 perm 3f010000  1000  1000 keyring  _pid: 2
25d3a08f I--Q---   1 perm 1f3f0000  1000 65534 keyring  _uid_ses.1000: 1
28576bd8 I--Q---   3 perm 3f010000  1000  1000 keyring  _krb: 1
2c546d21 I--Q--- 190 perm 3f030000  1000  1000 keyring  _ses: 2
30a4e0be I------   4   2d 1f030000  1000 65534 keyring  _persistent.1000: 1
32100fab I--Q---   4 perm 1f3f0000  1000 65534 keyring  _uid.1000: 2
32a387ea I--Q---   1 perm 3f010000  1000  1000 keyring  _pid: 2
3ce56aea I--Q---   5 perm 3f030000  1000  1000 keyring  _ses: 1

              The fields shown in each line of this file are  as  fol‐
              lows:

              ID     The  ID  (serial number) of the key, expressed in
                     hexadecimal.

              Flags  A set of flags describing the state of the key:

                     I   The key has been instantiated.

                     R   The key has been revoked.

                     D   The key is dead (i.e., has been deleted).  (A
                         key  may  be  briefly  in  this  state during
                         garbage collection.)

                     Q   The key contributes to the user's quota.

                     U   The key is under construction via a  callback
                         to user space; see request-key(2).

                     N   The key is negatively instantiated.

                     i   The key has been invalidated.

              Usage  This  is  a count of the number of kernel creden‐
                     tial structures that are pinning the key (approx‐
                     imately: the number of threads and open file ref‐
                     erences that refer to this key).

              Timeout
                     The amount of time until  the  key  will  expire,
                     expressed  in  human-readable  form (weeks, days,
                     hours, minutes, and seconds).   The  string  perm
                     here  means  that  the key is permanent (no time‐
                     out).  The string expd means  that  the  key  has
                     already  expired,  but  has  not yet been garbage
                     collected.

              Permissions
                     The key permissions, expressed as four  hexadeci‐
                     mal  bytes  containing,  from  left to right, the
                     possessor, user, group, and other permissions.

              UID    The user ID of the key owner.

              GID    The group ID of the key.  The value -1 here means
                     that  the  key  as no group ID; this can occur in
                     certain circumstances for  keys  created  by  the
                     kernel.

              Type   The key type (user, keyring, etc.)

              Description
                     The key description (name).

              Description
                     This field contains descriptive information about
                     the key.  For most key tpes, it has the form

                          desc[: extra-info]

                     The name subfield is the  the  key's  description
                     (name).   The  optional extra-info field provides
                     some further  information  about  the  key.   The
                     information  that appears here depends on the key
                     type, as follows:

                     "user" and "logon"
                         The  size  in  bytes  of  the   key   payload
                         (expressed in decimal).

                     "keyring"
                         The  number of keys linked to the keyring, or
                         the string empty if there are no keys  linked
                         to the keyring.

                     "big_key"
                         The payload size in bytes, followed either by
                         the string [file], if the key payload exceeds
                         the  threshold that means that the payload is
                         stored in a (swappable) tmpfs filesystem,  or
                         otherwise  the string [buff], indicating that
                         the key is small enough to reside  in  kernel
                         memory.

                     For  the ".request_key_auth" key type (authoriza‐
                     tion key; see  request_key(2)),  the  description
                     field  has  the form shown in the following exam‐
                     ple:

                         key:c9a9b19 pid:28880 ci:10

                     The three subfields are as follows:

                     key  The hexadecimal ID of the key being  instan‐
                          tiated in the requesting program.

                     pid  The PID of the requesting program.

                     ci   The  length  of  the callout data with which
                          the requested  key  should  be  instantiated
                          (i.e.,  the length of the payload associated
                          with the authorization key).

       /proc/key-users (since Linux 2.6.10)
              This file lists various information  for  each  user  ID
              that  has at least one key on the system.  An example of
              the data that one might see in this file is the  follow‐
              ing:

                     0:    10 9/9 2/1000000 22/25000000
                    42:     9 9/9 8/200 106/20000
                  1000:    11 11/11 10/200 271/20000

              The fields shown in each line are as follows:

              uid    The user ID.

              usage  This  is  a  kernel-internal  usage count for the
                     kernel structure used to record key users.

              nkeys/nikeys
                     The total number of keys owned by the  user,  and
                     the number of those keys that have been instanti‐
                     ated.

              qnkeys/maxkeys
                     The number of keys owned by  the  user,  and  the
                     maximum keys that the user may own.

              qnbytes/maxbytes
                     The  number  of bytes consumed in payloads of the
                     keys owned by this user, and the upper  limit  on
                     the  number  of  bytes  in  key payloads for that
                     user.

       /proc/sys/kernel/keys/gc_delay (since Linux 2.6.32)
              The value in this file specifies the interval,  in  sec‐
              onds,  after  which  revoked  and  expired  keys will be
              garbage collected.  The purpose of having such an inter‐
              val  is  so  that  there  is a window of time where user
              space can see an  error  (respectively  EKEYREVOKED  and
              EKEYEXPIRED) that indicates what happened to the key.

              The default value in this file is 300 (i.e., 5 minutes).

       /proc/sys/kernel/keys/persistent_keyring_expiry   (since  Linux
       3.13)
              This file defines an interval, in seconds, to which  the
              persistent keyring's expiration timer is reset each time
              the keyring is accessed (via keyctl_get_persistent(3) or
              the keyctl(2) KEYCTL_GET_PERSISTENT operation.)

              The default value in this file is 259200 (i.e., 3 days).

       The  following  files  (which  are  writable by privileged pro‐
       cesses) are used to enforce quotas on the number  of  keys  and
       number of bytes of data that can be stored in key payloads:

       /proc/sys/kernel/keys/maxbytes (since Linux 2.6.26)
              This  is the maximum number of bytes of data that a non‐
              root user can hold in the payloads of the keys owned  by
              the user.

              The default value in this file is 20,000.

       /proc/sys/kernel/keys/maxkeys (since Linux 2.6.26)
              This  is  the maximum number of keys that a nonroot user
              may own.

              The default value in this file is 200.

       /proc/sys/kernel/keys/root_maxbytes (since Linux 2.6.26)
              This is the maximum number of bytes  of  data  that  the
              root user (UID 0 in the root user namespace) can hold in
              the payloads of the keys owned by root.

              The default value in this file is 25,000,000.

       /proc/sys/kernel/keys/root_maxkeys (since Linux 2.6.26)
              This is the maximum number of keys that  the  root  user
              (UID 0 in the root user namespace) may own.

              The default value in this file is 1,000,000.

       With respect to keyrings, note that each link in a keyring con‐
       sumes 4 bytes of the keyring payload.

   Users
       The Linux key-management facility has a  number  of  users  and
       usages, but is not limited to those that already exist.

       In-kernel users of this facility include:

       Network filesystems - DNS
              The  kernel  uses  the  upcall mechanism provided by the
              keys to upcall to user space to do DNS lookups and  then
              to cache the results.

       AF_RXRPC and kAFS - Authentication
              The  AF_RXRPC  network  protocol  and  the in-kernel AFS
              filesystem use keys to store the  ticket  needed  to  do
              secured  or encrypted traffic.  These are then looked up
              by network operations on AF_RXRPC and filesystem  opera‐
              tions on kAFS.

       NFS - User ID mapping
              The  NFS  filesystem uses keys to store mappings of for‐
              eign user IDs to local user IDs.

       CIFS - Password
              The CIFS filesystem uses keys  to  store  passwords  for
              accessing remote shares.

       Module verification
              The  kernel  build  process can be made to cryptographi‐
              cally sign modules.  That signature is then checked when
              a module is loaded.

       User-space users of this facility include:

       Kerberos key storage
              The  MIT  Kerberos  5 facility (libkrb5) can use keys to
              store authentication tokens which  can  be  made  to  be
              automatically  cleaned up a set time after the user last
              uses them, but until then permits them  to  hang  around
              after  the  user has logged out so that cron scripts can
              use them.

SEE ALSO
       keyutils(7), persistent-keyring(7), process-keyring(7),
       session-keyring(7), thread-keyring(7), user-keyring(7),
       user-session-keyring(7), pam_keyinit(8)



Linux                         2016-11-01                   KEYRINGS(7)

-- 
Michael Kerrisk, man7.org Training and Consulting
mtk-ASgREoAs3yw@public.gmane.org, http://man7.org/training/
"The Linux Programming Interface" -- http://man7.org/tlpi/

--------------938A9A6E7B0A9D0B80F45E20
Content-Type: application/x-troff-man;
 name="keyrings.7"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="keyrings.7"

.\"
.\" Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
.\" Written by David Howells (dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org)
.\" and Copyright (C) 2016 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" %%%LICENSE_START(GPLv2+_SW_ONEPARA)
.\" This program is free software; you can redistribute it and/or
.\" modify it under the terms of the GNU General Public Licence
.\" as published by the Free Software Foundation; either version
.\" 2 of the Licence, or (at your option) any later version.
.\" %%%LICENSE_END
.\"
.TH KEYRINGS 7 2016-11-01 Linux "Linux Programmer's Manual"
.SH NAME
keyrings \- in-kernel key management and retention facility
.SH DESCRIPTION
The Linux key-management facility
is primarily a way for drivers to retain or cache security data,
authentication keys, encryption keys, and other data in the kernel.
.P
System call interfaces are provided so that user-space programs can manage those
objects and also use the facility for their own purposes.
.P
A library and some user-space utilities are provided to allow access to the
facility.
See
.BR keyctl (1),
.BR keyctl (3),
and
.BR keyutils (7)
for more information.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS Keys
A key has the following attributes:
.TP
Serial number (ID)
This is a unique integer handle by which a key is referred to in system call
arguments.
The serial number is sometimes synonymously referred as the key ID.
Programmatically, key serial numbers are represented using the type
.IR key_serial_t .
.TP
Type
A key's type defines what sort of data can be held in the key,
how the proposed content of the key will be parsed,
and how the payload will be used.

There are a number of general purpose types available, plus some specialist
types defined by specific drivers.
.TP
Description (name)
The key description is a printable string that is used as the search term
for the key (in conjunction with the key type) as well as a display name.
During searches, the description may be partially matched or exactly matched.
.TP
Payload (data)
The payload is the actual content of a key.
This is usually set when a key is created,
but it is possible for the kernel to upcall to user space to finish the
instantiation of a key if that key wasn't already known to the kernel
when it was requested.
(Details can be found in
.BR request_key (2).)

A key's payload can be read and updated if the key type supports it and if
suitable permission is granted to the caller.
.TP
Access rights
Much as files do,
each key has an owning user ID, an owning group ID, and a security label.
They also have a set of permissions,
though there are more than for a normal UNIX file,
and there is an additional category beyond the usual user,
group, and other (see below).

Note that keys are quota controlled since they represent unswappable kernel
memory and the owning user ID specifies whose quota is to be debited.
.TP
Expiration time
Each key can have an expiration time set.
When that time is reached,
the key is marked as being expired and accesses to it fail with
.BR EKEYEXPIRED .
If not deleted, updated, or replaced, after a set amount of time,
expired keys are automatically removed along with all links to them,
and attempts to access the key will fail with the error
.BR ENOKEY .
.TP
Reference count
Each key has a reference count.
Keys are referenced by keyrings, by currently active users,
and by a process's credentials.
When the reference count reaches zero,
the key is scheduled for garbage collection.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS Key types
The facility provides several basic types of key:
.TP
.I """user"""
This is a general purpose key type.
The key is kept entirely within kernel memory.
The payload may be read and updated by user-space applications.

The payload for keys of this type is a blob of arbitrary data
of up to 32,767 bytes.

The description may be any valid string, though it is preferred that it
start with a colon-delimited prefix representing the service
to which the key is of interest
(for instance
.IR """afs:mykey""" ).
.TP
.I """keyring"""
Keyrings are special keys whose payload consists of a set of links
to other keys (including other keyrings),
analogous to a directory holding links to files.
The main purpose of a keyring is to prevent other keys from
being garbage collected because nothing refers to them.
.TP
.IR """logon""" " (since Linux 3.3)"
.\" commit 9f6ed2ca257fa8650b876377833e6f14e272848b
This key type is essentially the same as
.IR """user""" ,
but it does not provide reading (i.e., the
.BR keyctl (2)
.BR KEYCTL_READ
operation),
meaning that the key payload is never visible from user space.
This is suitable for storing username-password pairs
that you do not want to be readable from user space.
.TP
.IR """big_key""" " (since Linux 3.13)"
.\" commit ab3c3587f8cda9083209a61dbe3a4407d3cada10
This key type is similar to the
.I """user"""
key type, but it may hold a payload of up to 1MiB in size.
The data may be stored in the swap space rather than in kernel memory
if the data size exceeds the overhead of storing the data in swap space
(a tmpfs file is used, which requires filesystem structures
to be allocated in the kernel).
This key type is useful for tasks such as holding Kerberos ticket caches.
.PP
There are more specialized key types available also, but they're not discussed
here as they're not intended for normal user-space use.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS Keyrings
As previously mentioned, keyrings are a special type of key that contain links
to other keys (which may include other keyrings).
Keys may be linked to by multiple keyrings.
Keyrings may be considered as analogous to UNIX directories
where each directory contains a set of hard links to files.
.P
Various operations (system calls) may be applied only to keyrings:
.IP Adding
A key may be added to a keyring by system calls that create keys.
This prevents the new key from being immediately deleted
when the system call driver releases its last reference to the key.
.IP Linking
A link may be added to a keyring pointing to a key that is already known,
provided this does not create a self-referential cycle.
.IP Unlinking
A link may be removed from a keyring.
When the last link to a key is removed,
that key will be scheduled for deletion by the garbage collector.
.IP Clearing
All the links may be removed from a keyring.
.IP Searching
A keyring may be considered the root of a tree or subtree in which keyrings
form the branches and non-keyrings the leaves.
This tree may be searched for a leaf matching
a particular type and description.
.P
See
.BR keyctl_clear (3),
.BR keyctl_link (3),
.BR keyctl_search (3),
and
.BR keyctl_unlink (3)
for more information.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS Anchoring keys
To prevent a key from being prematurely garbage collected,
it must anchored to keep its reference count elevated
when it is not in active use by the kernel.
.P
Keyrings are used to anchor other keys - each link is a reference on a
key - but whilst keyrings are available to link to keys, keyrings themselves
are just keys and are also subject to the same anchoring necessity.
.P
The kernel makes available a number of anchor keyrings.
Note that some of these keyrings will be created only when first accessed.
.TP
Process keyrings
Process credentials themselves reference keyrings with specific semantics.
These keyrings are pinned as long as the set of credentials exists,
which is usually as long as the process exists.
.IP
There are three keyrings with different inheritance/sharing rules:
The
.BR session-keyring (7)
(inherited and shared by all child processes),
the
.BR process-keyring (7)
(shared by all threads in a process) and
the
.BR thread-keyring (7)
(specific to a particular thread).
.TP
User keyrings
Each UID known to the kernel has a record that contains two keyrings: the
.BR user-keyring (7)
and the
.BR user-session-keyring (7).
These exist for as long as the UID record in the kernel exists.
A link to the user keyring is placed in a new session keyring by
.BR pam_keyinit (8) 
when a new login session is initiated.
.TP
Persistent keyrings
There is a
.BR persistent-keyring (7)
available to each UID known to the system.
It may persist beyond the life of the UID record previously mentioned,
but has an expiration time set such that it is automatically cleaned up
after a set time.
This, for example, permits cron scripts to use credentials left when the
user logs out.
.IP
Note that the expiration time is reset every time the persistent key is
requested.
.TP
Special keyrings
There are special keyrings owned by the kernel that can anchor keys
for special purposes.
An example of this is the \fIsystem keyring\fR used for holding
encryption keys for module signature verification.
.IP
These special keyrings  are usually closed to direct alteration
by user space.
.P
See
.BR thread-keyring (7),
.BR process-keyring (7),
.BR session-keyring (7),
.BR user-keyring (7),
.BR user-session-keyring (7),
and
.BR persistent-keyring (7)
for more information.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS Possession
The concept of possession is important to understanding the keyrings
security model.
Whether a thread possesses a key is determined by the following rules:
.IP (1) 4
Any key or keyring that does not grant
.I search
permission to the caller is ignored in all the following rules.
.IP (2)
A thread \fIpossesses\fR its \fBsession\fR, \fBprocess\fR, and \fBthread\fR
keyrings directly because those are pointed to by its credentials.
.IP (3)
If a keyring is possessed, then any key it links to is \fIalso\fR possessed.
.IP (4)
If any key a keyring links to is itself a keyring, then rule (3) applies
\fIrecursively\fP.
.IP (5)
If a process is upcalled from the kernel to instantiate a key, then it also
possesses the \fIrequester's\fP keyrings as in rule (1) as if it were the
requester.
.P
Note that possession is not a fundamental property of a key,
but must rather be calculated each time the key is needed.
.P
Possession is designed to allow set-user-ID programs run from, say
a user's shell to access the user's keys.
It also allows the prevention of access to keys
just on the basis of UID and GID matches.
.P
When it creates the session keyring,
.BR pam_keyinit (8)
adds a link to the
.BR user-keyring (7),
thus making the user keyring and anything it contains possessed by default.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS Access rights
Each key has the following security-related attributes:
.IP * 3
The owning user ID
.IP *
The ID of a group that is permitted to access the key
.IP *
A security label
.IP *
A permissions mask
.P
The permissions mask contains four sets of rights.
The first three sets are mutually exclusive.
One and only one will be in force for a particular access check.
In order of descending priority, these three sets are:
.IP \fIuser\fR
The set specifies the rights granted
if the key's user ID matches the caller's filesystem user ID.
.IP \fIgroup\fR
The set specifies the rights granted
if the user ID didn't match and the key's group ID matches the caller's
filesystem GID or one of the caller's supplementary group IDs.
.IP \fIother\fR
The set specifies the rights granted
if neither the key's user ID nor group ID matched.
.P
The fourth set of rights is:
.IP \fIpossessor\fR
The set specifies the rights granted
if a key is determined to be possessed by the caller.
.P
The complete set of rights for a key is the union of whichever
of the first three sets is applicable plus the fourth set
if the key is possessed.
.P
The set of rights that may be granted in each of the four masks
is as follows:
.TP
.I view
The attributes of the key may be read.
This includes the type,
description, and access rights (excluding the security label).
.TP
.I read
For a key: the payload of the key may be read.
For a keyring: the list of serial numbers (keys) to
which the keyring has links may be read.
.TP
.I write
The payload of the key may be updated.
For a keyring, links may be added to or removed from the keyring,
the keyring may be cleared completely (all links are removed),
and the key may be revoked.
.TP
.I search
For a key (or a keyring): the key may be found by a search.
For a keyring: keys and keyrings that are linked to by the
keyring may be searched.
.TP
.I link
Links may be created from keyrings to the key.
The initial link to a key that is established when the key is created
doesn't require this permission.
.TP
.I setattr
The ownership details and security label of the key may be changed,
the key's expiration time may be set, and the key may be revoked.
.P
If any right is granted to a thread for a key,
.\" FIXME This seems to contradict the text below, which says that 'view'
.\" permission is what is significant.
then that thread will see the key listed in
.IR /proc/keys .
If no rights at all are granted, then that thread
can't even tell that the key exists.
.P
In addition to access rights, any active Linux Security Module (LSM) may
prevent access to a key if its policy so dictates.
A key may be given a
security label or other attribute by the LSM which can be retrieved.
.P
See
.BR keyctl_chown (3),
.BR keyctl_describe (3),
.BR keyctl_get_security (3),
.BR keyctl_setperm (3),
and
.BR selinux (8)
for more information.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS Searching for keys
One of the key features of the Linux key-management facility
is the ability to find a key that a process is retaining.
The
.BR request_key (2)
system call is the primary point of
access for user-space applications to find a key.
(internally, the kernel has something similar available
for use by internal components that make use of keys.)
.P
The search algorithm works as follows:
.IP (1) 4
The three process keyrings are searched in the following order: the thread
.BR thread-keyring (7)
if it exists, the
.BR process-keyring (7)
if it exists, and then either the
.BR session-keyring (7)
if it exists or the
.BR user-session-keyring (7)
if that exists.
.IP (2)
If the caller was a process that was invoked by the
.BR request_key (2)
upcall mechanism then the keyrings of the original caller of that
.BR request_key (2)
will be searched as well.
.IP (3)
The search of the keyring tree is in preorder:
each keyring is searched first for a match,
then the keyrings referred to by that keyring are searched.
.IP (4)
If a matching key is found that is valid,
then the search terminates and that key is returned.
.IP (5)
If a matching key is found that has an error state attached,
that error state is noted and the search continues.
.IP (6)
If valid matching key is found,
then the first noted error state is returned; otherwise, an 
.B ENOKEY
error is returned.
.P
It is also possible to search a specific keyring, in which case only steps (3)
to (6) apply.
.P
See
.BR request_key (2)
and
.BR keyctl_search (3)
for more information.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS On-demand key creation
If a key cannot be found,
.BR request_key (2)
will, if given a
.I callout_info
argument, create a new key and then upcall to user space to
instantiate the key.
This allows keys to be created on an as-needed basis.
.P
Typically, this will involve the kernel forking and exec'ing the
.BR request-key (8)
program, which will then execute the appropriate handler based on its
configuration.
.P
The handler is passed a special authorization key that allows it
and only it to instantiate the new key.
This is also used to permit searches performed by the
handler program to also search the requester's keyrings.
.P
See
.BR request_key (2),
.BR keyctl_assume_authority (3),
.BR keyctl_instantiate (3),
.BR keyctl_negate (3),
.BR keyctl_reject (3),
.BR request-key (8)
and
.BR request-key.conf (5)
for more information.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS /proc files
The kernel provides various
.I /proc
files that expose information about keys or define limits on key usage.
.TP
.IR /proc/keys " (since Linux 2.6.10)"
This file exposes a list of the keys that
are viewable by the reading process,
providing various information about each key.

The only keys included in the list are those that grant
.I view
permission to the reading process,
regardless of whether or not it possesses them.
LSM security checks are still performed,
and may filter out further keys that the process is not authorized to view.

An example of the data that one might see in this file is the following:

.nf
.in 0n
009a2028 I--Q---   1 perm 3f010000  1000  1000 user     krb_ccache:primary: 12
1806c4ba I--Q---   1 perm 3f010000  1000  1000 keyring  _pid: 2
25d3a08f I--Q---   1 perm 1f3f0000  1000 65534 keyring  _uid_ses.1000: 1
28576bd8 I--Q---   3 perm 3f010000  1000  1000 keyring  _krb: 1
2c546d21 I--Q--- 190 perm 3f030000  1000  1000 keyring  _ses: 2
30a4e0be I------   4   2d 1f030000  1000 65534 keyring  _persistent.1000: 1
32100fab I--Q---   4 perm 1f3f0000  1000 65534 keyring  _uid.1000: 2
32a387ea I--Q---   1 perm 3f010000  1000  1000 keyring  _pid: 2
3ce56aea I--Q---   5 perm 3f030000  1000  1000 keyring  _ses: 1
.in
.fi

The fields shown in each line of this file are as follows:
.RS
.TP
ID
The ID (serial number) of the key, expressed in hexadecimal.
.TP
Flags
A set of flags describing the state of the key:
.RS
.IP I 4
The key has been instantiated.
.IP R
The key has been revoked.
.IP D
The key is dead (i.e., has been deleted).
(A key may be briefly in this state during garbage collection.)
.IP Q
The key contributes to the user's quota.
.IP U
The key is under construction via a callback to user space;
see
.BR request-key (2).
.IP N
The key is negatively instantiated.
.IP i
The key has been invalidated.
.RE
.TP
Usage
This is a count of the number of kernel credential
structures that are pinning the key
(approximately: the number of threads and open file references
that refer to this key).
.TP
Timeout
The amount of time until the key will expire,
expressed in human-readable form (weeks, days, hours, minutes, and seconds).
The string
.I perm
here means that the key is permanent (no timeout).
The string
.I expd
means that the key has already expired,
but has not yet been garbage collected.
.TP
Permissions
The key permissions, expressed as four hexadecimal bytes containing,
from left to right, the possessor, user, group, and other permissions.
.TP
UID
The user ID of the key owner.
.TP
GID
The group ID of the key.
The value \-1 here means that the key as no group ID;
this can occur in certain circumstances for keys created by the kernel.
.TP
Type
The key type (user, keyring, etc.)
.TP
Description
The key description (name).
.TP
Description
This field contains descriptive information about the key.
For most key tpes, it has the form

     desc[: extra\-info]

The
.I name
subfield is the the key's description (name).
The optional
.I extra\-info
field provides some further information about the key.
The information that appears here depends on the key type, as follows:
.RS
.TP 4
.IR """user""" " and " """logon"""
The size in bytes of the key payload (expressed in decimal).
.TP
.IR """keyring"""
The number of keys linked to the keyring,
or the string
.IR empty
if there are no keys linked to the keyring.
.TP
.IR """big_key"""
The payload size in bytes, followed either by the string
.IR [file] ,
if the key payload exceeds the threshold that means that the
payload is stored in a (swappable) tmpfs filesystem,
or otherwise the string
.IR [buff] ,
indicating that the key is small enough to reside in kernel memory.
.RE
.IP
For the
.IR """.request_key_auth"""
key type
(authorization key; see
.BR request_key (2)),
the description field has the form shown in the following example:

    key:c9a9b19 pid:28880 ci:10

The three subfields are as follows:
.RS
.TP 5
.I key
The hexadecimal ID of the key being instantiated in the requesting program.
.TP
.I pid
The PID of the requesting program.
.TP
.I ci
The length of the callout data with which the requested key should
be instantiated
(i.e., the length of the payload associated with the authorization key).
.RE
.RE
.TP
.IR /proc/key-users " (since Linux 2.6.10)"
This file lists various information for each user ID that
has at least one key on the system.
An example of the data that one might see in this file is the following:

.nf
.in +4n
   0:    10 9/9 2/1000000 22/25000000
  42:     9 9/9 8/200 106/20000
1000:    11 11/11 10/200 271/20000
.in
.fi

The fields shown in each line are as follows:
.RS
.TP
.I uid
The user ID.
.TP
.I usage
This is a kernel-internal usage count for the kernel structure
used to record key users.
.TP
.IR nkeys / nikeys
The total number of keys owned by the user,
and the number of those keys that have been instantiated.
.TP
.IR qnkeys / maxkeys
The number of keys owned by the user,
and the maximum keys that the user may own.
.TP
.IR qnbytes / maxbytes
The number of bytes consumed in payloads of the keys owned by this user,
and the upper limit on the number of bytes in key payloads for that user.
.RE
.TP
.IR /proc/sys/kernel/keys/gc_delay " (since Linux 2.6.32)"
.\" commit 5d135440faf7db8d566de0c6fab36b16cf9cfc3b
The value in this file specifies the interval, in seconds,
after which revoked and expired keys will be garbage collected.
The purpose of having such an interval is so that there is a window
of time where user space can see an error (respectively
.BR EKEYREVOKED
and
.BR EKEYEXPIRED )
that indicates what happened to the key.

The default value in this file is 300 (i.e., 5 minutes).
.TP
.IR /proc/sys/kernel/keys/persistent_keyring_expiry " (since Linux 3.13)"
.\" commit f36f8c75ae2e7d4da34f4c908cebdb4aa42c977e
This file defines an interval, in seconds,
to which the persistent keyring's expiration timer is reset
each time the keyring is accessed (via
.BR keyctl_get_persistent (3)
or the
.BR keyctl (2)
.B KEYCTL_GET_PERSISTENT
operation.)

The default value in this file is 259200 (i.e., 3 days).
.PP
The following files (which are writable by privileged processes)
are used to enforce quotas on the number of keys
and number of bytes of data that can be stored in key payloads:
.TP
.IR /proc/sys/kernel/keys/maxbytes " (since Linux 2.6.26)"
.\" commit 0b77f5bfb45c13e1e5142374f9d6ca75292252a4
.\" Previously: KEYQUOTA_MAX_BYTES      10000
This is the maximum number of bytes of data that a nonroot user
can hold in the payloads of the keys owned by the user.

The default value in this file is 20,000.
.TP
.IR /proc/sys/kernel/keys/maxkeys " (since Linux 2.6.26)"
.\" commit 0b77f5bfb45c13e1e5142374f9d6ca75292252a4
.\" Previously: KEYQUOTA_MAX_KEYS       100
This is the maximum number of keys that a nonroot user may own.

The default value in this file is 200.
.TP
.IR /proc/sys/kernel/keys/root_maxbytes " (since Linux 2.6.26)"
This is the maximum number of bytes of data that the root user
(UID 0 in the root user namespace)
can hold in the payloads of the keys owned by root.

The default value in this file is 25,000,000.
.\" commit 0b77f5bfb45c13e1e5142374f9d6ca75292252a4
.TP
.IR /proc/sys/kernel/keys/root_maxkeys " (since Linux 2.6.26)"
.\" commit 0b77f5bfb45c13e1e5142374f9d6ca75292252a4
This is the maximum number of keys that the root user
(UID 0 in the root user namespace)
may own.

The default value in this file is 1,000,000.
.PP
With respect to keyrings,
note that each link in a keyring consumes 4 bytes of the keyring payload.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SS Users
The Linux key-management facility has a number of users and usages,
but is not limited to those that already exist.
.P
In-kernel users of this facility include:
.TP
Network filesystems - DNS
The kernel uses the upcall mechanism provided by the keys to upcall to
user space to do DNS lookups and then to cache the results.
.TP
AF_RXRPC and kAFS - Authentication
The AF_RXRPC network protocol and the in-kernel AFS filesystem
use keys to store the ticket needed to do secured or encrypted traffic.
These are then looked up by
network operations on AF_RXRPC and filesystem operations on kAFS.
.TP
NFS - User ID mapping
The NFS filesystem uses keys to store mappings of
foreign user IDs to local user IDs.
.TP
CIFS - Password
The CIFS filesystem uses keys to store passwords for accessing remote shares.
.TP
Module verification
The kernel build process can be made to cryptographically sign modules.
That signature is then checked when a module is loaded.
.P
User-space users of this facility include:
.TP
Kerberos key storage
The MIT Kerberos 5 facility (libkrb5) can use keys to store authentication
tokens which can be made to be automatically cleaned up a set time after the
user last uses them,
but until then permits them to hang around after the user
has logged out so that cron scripts can use them.
.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.SH SEE ALSO
.ad l
.nh
.BR keyutils (7),
.BR persistent\-keyring (7),
.BR process\-keyring (7),
.BR session\-keyring (7),
.BR thread\-keyring (7),
.BR user\-keyring (7),
.BR user\-session\-keyring (7),
.BR pam_keyinit (8)

--------------938A9A6E7B0A9D0B80F45E20--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
