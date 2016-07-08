From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 118671] mkfifo(3) & mknod(2) and EPERM
Date: Fri, 08 Jul 2016 14:56:40 +0000
Message-ID: <bug-118671-11311-dqY9cV0FjY@https.bugzilla.kernel.org/>
References: <bug-118671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-118671-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D118671

--- Comment #4 from Navin <navinp1912-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I don't think so . This is not a bug. Please see below for the details.

=46rom mount command manpage=20
          For most types all the mount program has to do is issue a sim=
ple
mount(2) system call, and no detailed knowledge of the filesystem type =
is=20
required.For  a  few types however (like nfs, nfs4, cifs, smbfs, ncpfs)=
 an ad
hoc code is necessary.  The nfs, nfs4, cifs, smbfs, and ncpfs filesyste=
ms have
a separate mount program.  In order to make it possible to treat all ty=
pes in a
uniform way, mount will execute the program /sbin/mount.type  (if  that=
       =20
   exists)  when called with type type.  Since different versions of th=
e
smbmount program have different calling conventions, /sbin/mount.smbfs =
may have
           to be a shell script that sets up the desired call.


Now looking at mount.cifs(8)

=46rom mount.cifs(8) from cifs-utils not related to kernel manpages.

sfu
           When the CIFS Unix Extensions are not negotiated, attempt to=
 create
device files and fifos in a format compatible with Services for Unix (S=
=46U). In
addition retrieve bits 10-12 of the mode via the SETFILEBITS extended a=
ttribute
(as SFU does). In the future the bottom 9 bits of the mode mode also   =
    =20
will be emulated using queries of the security descriptor (ACL). [NB: r=
equires
version 1.39 or later of the CIFS VFS. To recognize symlinks and be abl=
e      =20
  to create symlinks in an SFU interoperable form requires version 1.40=
 or
later of the CIFS VFS kernel module.

 nounix
           Disable the CIFS Unix Extensions for this mount. This can be=
 useful
in order to turn off multiple settings at once. This includes POSIX acl=
s, POSIX
          locks, POSIX paths, symlink support and retrieving uids/gids/=
mode
from the erver. This can also be useful to work around a bug in a serve=
r that =20
        supports Unix Extensions.


INODE NUMBERS
       When Unix Extensions are enabled, we use the actual inode number
provided by the server in response to the POSIX calls as an inode numbe=
r.

       When Unix Extensions are disabled and "serverino" mount option i=
s
enabled there is no way to get the server inode number. The client typi=
cally
maps the server-assigned "UniqueID" onto an inode number.

       Note that the UniqueID is a different value from the server inod=
e
number. The UniqueID value is unique over the scope of the entire serve=
r and is
often  greater than 2 power 32. This value often makes programs that ar=
e not
compiled with LFS (Large File Support), to trigger a glibc EOVERFLOW er=
ror as
this won=C2=B4t fit in the target structure field. It is strongly recom=
mended to
compile your programs with LFS support (i.e. with -D_FILE_OFFSET_BITS=3D=
64) to
prevent this problem. You can also use "noserverino" mount option to ge=
nerate
inode numbers smaller than 2 power 32 on the client. But you may not be=
 able to
detect hardlinks properly.


Here is for volume smb running on ubuntu , this CIFS extensions are com=
ing from
server

smbclient -N //127.0.0.1/Movies -c "posix"
WARNING: The "syslog" option is deprecated
Domain=3D[WORKGROUP] OS=3D[Windows 6.1] Server=3D[Samba 4.3.9-Ubuntu]
Server supports CIFS extensions 1.0
Server supports CIFS capabilities locks acls pathnames posix_path_opera=
tions
large_read posix_encrypt
junk@junk-foo:~/android/samba-4.4.5/source3$ smbclient -N //127.0.0.1/M=
ovies -c
"volume"
WARNING: The "syslog" option is deprecated
Domain=3D[WORKGROUP] OS=3D[Windows 6.1] Server=3D[Samba 4.3.9-Ubuntu]
Volume: |Movies| serial number 0x735d0d3c
junk@junk-foo:~/android/samba-4.4.5/source3$=20

win10

Domain=3D[DESKTOP-T9GDCOU] OS=3D[Windows 10 Pro 10240] Server=3D[Window=
s 10 Pro 6.3]
smb: \> posix
Server doesn't support UNIX CIFS extensions.
smb: \>=20

root@junk-foo:/mnt/24# touch foo
root@junk-foo:/mnt/24# ls -l foo
-rwxr-xr-x 1 root root 0 Jul  8 20:11 foo
root@junk-foo:/mnt/24# mkfifo abcd
mkfifo: cannot create fifo 'abcd': Operation not permitted
root@junk-foo:/mnt/24# ls
foo
root@junk-foo:/mnt/24# mknod dev b 1 2
mknod: dev: Operation not permitted


root@junk-foo:/mnt/24# mount | grep PerfLogs
//192.168.122.12/PerfLogs on /mnt/24 type cifs
(rw,relatime,vers=3D1.0,cache=3Dstrict,username=3Djunk,domain=3DDESKTOP=
-T9GDCOU,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.122.12,fi=
le_mode=3D0755,dir_mode=3D0755,nounix,serverino,mapposix,rsize=3D61440,=
wsize=3D65536,echo_interval=3D60,actimeo=3D1)

Default mount.smbfs disables this creation below it does with nounix op=
tion and
without sfu.



Now add sfu option and  mount=20

root@junk-foo:/mnt/24# mount | grep PerfLogs
//192.168.122.12/PerfLogs on /mnt/24 type cifs
(rw,relatime,vers=3D1.0,cache=3Dstrict,username=3Djunk,domain=3DDESKTOP=
-T9GDCOU,uid=3D0,noforceuid,gid=3D0,noforcegid,addr=3D192.168.122.12,fi=
le_mode=3D0755,dir_mode=3D0755,nounix,serverino,mapposix,sfu,dynperm,rs=
ize=3D61440,wsize=3D65536,echo_interval=3D60,actimeo=3D1)
root@junk-foo:/mnt/24# mknod devsmb b 1 2
root@junk-foo:/mnt/24# mkfifo fifosmb
root@junk-foo:/mnt/24# ls
devsmb  fifosmb  foo  newfoo
root@junk-foo:/mnt/24# cd
root@junk-foo:~# umount /mnt/24
root@junk-foo:~#=20


Now without dynperm

mount.cifs //192.168.122.12/PerfLogs /mnt/24 -o
user=3Djunk,dom=3DDESKTOP-T9GDCOU,sfu
Password for junk@//192.168.122.12/PerfLogs:  *********
root@junk-foo:~# cd /mnt/24
root@junk-foo:/mnt/24# ls
devsmb  fifosmb  foo  newfoo
root@junk-foo:/mnt/24# ls -l
total 1
brwxr-xr-x 1 root root 1, 2 Jul  8 20:13 devsmb
prwxr-xr-x 1 root root    0 Jul  8 20:14 fifosmb
-rwxr-xr-x 1 root root    0 Jul  8 20:11 foo
-rwxr-xr-x 1 root root    0 Jul  8 20:12 newfoo
root@junk-foo:/mnt/24# mkfifo newsmbfifo
root@junk-foo:/mnt/24# ls -l
total 1
brwxr-xr-x 1 root root 1, 2 Jul  8 20:13 devsmb
prwxr-xr-x 1 root root    0 Jul  8 20:14 fifosmb
-rwxr-xr-x 1 root root    0 Jul  8 20:11 foo
-rwxr-xr-x 1 root root    0 Jul  8 20:12 newfoo
prwxr-xr-x 1 root root    0 Jul  8 20:15 newsmbfifo
root@junk-foo:/mnt/24#=20


It is clear that even though the server doesn't support we can still cr=
eate
fifos and mknod and if the server does support you definitely can.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
