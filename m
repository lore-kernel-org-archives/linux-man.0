From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: For review: open_by_name_at(2) man page [v2]
Date: Wed, 19 Mar 2014 14:11:18 +0100
Message-ID: <53299776.6060305@gmail.com>
References: <53271B69.3000305@gmail.com> <53284233.3050800@gmail.com> <4037316.YIp1ssalrz@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4037316.YIp1ssalrz@vapier>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Cc: mtk.manpages@gmail.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger@dilger.ca>, NeilBrown <neilb@suse.de>, Christoph Hellwig <hch@infradead.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 03/19/2014 07:42 AM, Mike Frysinger wrote:
> On Tue 18 Mar 2014 13:55:15 Michael Kerrisk wrote:
>> The
>> .I flags
>> argument is a bit mask constructed by ORing together
>> zero or more of the following value:
>> .TP
>> .B AT_EMPTY_PATH
>> Allow
>> .I pathname
>> to be an empty string.
>> See above.
>> (which may have been obtained using the
>> .BR open (2)
>> .B O_PATH
>> flag).
>> .TP
>> .B AT_SYMLINK_FOLLOW
>> By default,
>> .BR name_to_handle_at ()
>> does not dereference
>> .I pathname
>> if it is a symbolic link.
>> The flag
>> .B AT_SYMLINK_FOLLOW
>> can be specified in
>> .I flags
>> to cause
>> .I pathname
>> to be dereferenced if it is a symbolic link.
>=20
> this section is only talking about |flags|, and further this part is =
only=20
> talking about AT_SYMLINK_FOLLOW.  so this last sentence sounds super=20
> redundant.
> how about reversing the sentence order so that both are implicit like=
 is done=20
> in the openat() page and the description of O_NOFOLLOW ?

I'm not sure that I completely understand you here, but I agree that th=
is could=20
be better. I've rewritten somewhat.

>> .B ENOTDIR
>> The file descriptor supplied in
>> .I dirfd
>> does not refer to a directory,
>> and it it is not the case that both
>=20
> "it" is duplicated

=46ixed.


>> .SS Obtaining a persistent filesystem ID
>> The mount IDs in
>> .IR /proc/self/mountinfo
>> can be reused as filesystems are unmounted and mounted.
>> Therefore, the mount ID returned by
>> .BR name_to_handle_at (3)
>=20
> should be () and not (3)

=46ixed.

> side note: this seems like an easy error to script for ...

Yep, I've got some scripts that I run manually now and then to=20
check for this sort of stuff.

>> $ \fBecho 'Kannst du bitte =FCberlegen?' > cecilia.txt\fP
>=20
> aber, ich spreche kein Deutsch :(
>=20
> do we have a standard about sticking to english ?  i wonder if people=
 are more=20
> likely to be confused or to appreciate it ...

=46air enough. I'm too influenced by recent work on the locale pages (a=
nd=20
family conversations ;-)). I'll switch it to English

>> #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
>>                         } while (0)
>=20
> i wonder if err.h makes sense now that this is a man page for complet=
ely=20
> linux-specific syscalls :).  and you use _GNU_SOURCE.

I'm not really convinced about using these functions, but I'll reflect=20
on it more.

>> int
>> main(int argc, char *argv[])
>> {
>>     struct file_handle *fhp;
>>     int mount_id, fhsize, s;
>>
>>     if (argc < 2 || strcmp(argv[1], "\-\-help") =3D=3D 0) {
>=20
> argc !=3D 2 ?

Yes, some cruft crept in.

>>     /* Allocate file_handle structure */
>>
>>     fhsize =3D sizeof(struct file_handle *);
>=20
> pretty sure this is wrong=20

<blush>

> as sizeof() here returns the size of a pointer, not=20
> the size of the struct.  it's why i prefer the form:
>=20
> 	fhsize =3D sizeof(*fhp);
>=20
> less typing and harder to screw up by accident.

Yep, changed.

> granted, the case below won't crash since the kernel only reads/write=
s=20
> sizeof(unsigned int) and i'm not aware of any system where that is la=
rger than=20
> sizeof(void *), but it's still wrong :).
>=20
>>     s =3D name_to_handle_at(AT_FDCWD, argv[1], fhp, &mount_id, 0);
>=20
> another personal style: create dedicated variables for each arg you u=
npack out=20
> of argv[1].  it's generally OK when you only take one arg, but when y=
ou get=20
> more than one, you end up flipping back and forth between the usage t=
rying to=20
> figure out what index 1 represents instead of focusing on what the co=
de is=20
> doing.
> 	const char *pathname =3D argv[1];

Yup.

>>     fhsize =3D sizeof(struct file_handle) + fhp\->handle_bytes;
>=20
> fhsize +=3D fhp->handle_bytes ?
>=20
> it's the same, but i think nicer ;)

Depends on your perspective. It relies on no one changing the code
so that fhsize is modified after the earlier initialization. And
also, with this line, I see exactly what is going on, in one place.
I'll leave as is.

>>     /* Write mount ID, file handle size, and file handle to stdout,
>>        for later reuse by t_open_by_handle_at.c */
>>
>>     if (write(STDOUT_FILENO, &mount_id, sizeof(int)) !=3D sizeof(int=
) ||
>>             write(STDOUT_FILENO, &fhsize, sizeof(int)) !=3D sizeof(i=
nt) ||
>>             write(STDOUT_FILENO, fhp, fhsize) !=3D fhsize) {
>=20
> seems like a whole lot of code spew for a simple printf() ?  you'd ha=
ve to=20
> adjust the other program to use scanf(), but seems like the end resul=
t would=20
> be nicer for users to experiment with ?

Yes. I'd already reflected on exactly that and made a change to using t=
ext=20
formats.

>> static int
>> open_mount_path_by_id(int mount_id)
>> {
>>     char *linep;
>>     size_t lsize;
>>     char mount_path[PATH_MAX];
>>     int fmnt_id, fnd, nread;
>=20
> could we buy a few more letters for these vars ?  i guess fmnt_id is =
the=20
> filesystem mount id, and fnd is "find".

When I was a kid, you had to pay a dollar for each letter...
(I've made a few changes.)

> also, getline() returns a ssize_t, not an int.

=46ixed.

>>     FILE *fp;
>>
>>     fp  =3D fopen("/proc/self/mountinfo", "r");
>=20
> only one space before the =3D

Yup.

> i would encourage using the "e" flag whenever possible in the hopes t=
hat=20
> someone might start using it in their own code base.
>=20
> 	fp =3D fopen("/proc/self/mountinfo", "re");

I'm of two minds about this. I foresee the day when I get a bug report =
that
says: "Why did you use 'e' here (or O_CLOEXEC)? It's not needed". So, I=
'm=20
inclined to leave this.

>>     for (fnd =3D 0; !fnd ; ) {
>=20
> in my experience, seems like a while() loop makes more sense when you=
're=20
> implementing a while() loop ...
> 	fnd =3D 0;
> 	while (!fnd) {

Yup. ;-}.

>>         linep =3D NULL;
>>         nread =3D getline(&linep, &lsize, fp);
>=20
> this works, but it's unusual when using getline() as it kind of defea=
ts the=20
> purpose of using the dyn allocation feature.
>=20
> 	fnd =3D 0;
> 	linep =3D NULL;
> 	while (!fnd) {
> 		nread =3D getline(&linep, &lsize, fp);
> 		...
> 	}
> 	free(linep);
>=20
> i don't think it complicates the code much more ?

Yes. Fixed.

>>         if (nread =3D=3D \-1)
>>             break;
>>
>> 	nread =3D sscanf(linep, "%d %*d %*s %*s %s", &fmnt_id, mount_path);
>=20
> indent is off here

=46ixed.

>>     return open(mount_path, O_RDONLY | O_DIRECTORY);
>=20
> O_CLOEXEC for funsies ?

See above comment.

>> int
>> main(int argc, char *argv[])
>> {
>>     struct file_handle *fhp;
>>     int mount_id, fd, mount_fd, fhsize;
>>     ssize_t nread;
>> #define BSIZE 1000
>>     char buf[BSIZE];
>=20
> why not sizeof(buf) and avoid the define ?

Done.

>>     if (argc > 1 && strcmp(argv[1], "\-\-help") =3D=3D 0) {
>>         fprintf(stderr, "Usage: %s [mount\-dir]]\\n",
>>                 argv[0]);
>=20
> how about also aborting when argc > 2 ?

Yes.

>>     if (argc > 1)
>>         mount_fd =3D open(argv[1], O_RDONLY | O_DIRECTORY);
>=20
> O_CLOEXEC ?

See comment above.

>>     nread =3D read(fd, buf, BSIZE);
>>     if (nread =3D=3D \-1)
>>         errExit("read");
>>     printf("Read %ld bytes\\n", (long) nread);
>=20
> yikes, that's a bad habit to encourage.  read() returns a ssize_t, so=
 print it=20
> out using %zd.

Calling it a bad habit seems a bit too strong. It's a habit conditioned=
 by writing=20
code that runs on systems that don't have C99. Less important these day=
s, of course.
I've changed it.

>> .SH SEE ALSO
>> .BR blkid (1),
>> .BR findfs (1),
>=20
> i don't have a findfs(1).  i do have a findfs(8) ...

Thanks. blkid(8) also, actually.

Thanks for the comments, Mike.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
