From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sysctl_writes_strict documentation + an oddity?
Date: Tue, 16 Jun 2015 12:03:48 +0200
Message-ID: <557FF484.9000207@gmail.com>
References: <554DCB33.8080101@gmail.com> <CAGXu5jL-9ZMDXPCNkhEB+jzVxHcK6Sa4gwg16kn60epwT+gJAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jL-9ZMDXPCNkhEB+jzVxHcK6Sa4gwg16kn60epwT+gJAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Kees,

On 06/04/2015 09:36 PM, Kees Cook wrote:
> On Sat, May 9, 2015 at 1:54 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Kees,
>>
>> I discovered that you added /proc/sys/kernel/sysctl_writes_strict in
>> Linux 3.16. In passing, I'll just mention that was an API change tha=
t
>> should have been CCed to linux-api-u79uwXL29TaiAVqoAR/hOA@public.gmane.org
>=20
> Sorry about that! I'm trying to get better. I think my main trigger
> for this is "if I'm adding a file to Documentation/ I should probably
> CC linux-api" now. :)
>=20
>> Anyway, I've tried to write this file up for the proc(5) man page,
>> and I have two requests:
>>
>> 1) Could you review this text?
>> 2) I've found some behavior that surprised me, and I am wondering if=
 it
>>    is intended. Could you let me know your thoughts?
>>
>> =3D=3D=3D=3D=3D 1) man-page text =3D=3D=3D=3D=3D
>>
>> The man-page text, heavily based on your text in
>> Documentation/sysctl/kernel.txt, is as follows:
>>
>>        /proc/sys/kernel/sysctl_writes_strict (since Linux 3.16)
>>               The  value  in  this  file  determines how the file of=
fset
>>               affects the behavior of updating entries  in  files  u=
nder
>>               /proc/sys.  The file has three possible values:
>>
>>               -1  This  provides  legacy  handling, with no printk w=
arn=E2=80=90
>>                   ings.  Each write(2) must fully contain the  value=
  to
>>                   be  written,  and  multiple  writes  on  the same =
file
>>                   descriptor will overwrite the entire value, regard=
less
>>                   of the file position.
>>
>>               0   (default)  This  provides the same behavior as for=
 -1,
>>                   but printk warnings are  written  for  processes  =
that
>>                   perform writes when the file offset is not 0.
>>
>>               1   Respect  the  file  offset  when  writing strings =
into
>>                   /proc/sys files.  Multiple writes will append  to =
 the
>>                   value  buffer.   Anything  written  beyond the max=
imum
>>                   length of the value buffer will be ignored.  Write=
s to
>>                   numeric  /proc/sys entries must always be at file =
off=E2=80=90
>>                   set 0 and the value must be  fully  contained  in =
 the
>>                   buffer provided to write(2).
>=20
> That looks correct, yes. Thanks!

Okay. Thanks.

>> =3D=3D=3D=3D=3D 2) Behavior puzzle (a) =3D=3D=3D=3D=3D
>>
>> The last sentence quoted from the man page was based on your sentenc=
e
>>
>>     Writes to numeric sysctl entries must always be at file position=
 0
>>     and the value must be fully contained in the buffer sent in the =
write
>>     syscall.
>>
>> So, I had interpreted /proc/sys/kernel/sysctl_writes_strict=3D=3D1 t=
o
>> mean that if one writes into a numeric /proc/sys file at an offset
>> other than zero, the write() will fail with some kind of error.
>=20
> Reporting back an error wasn't something I'd tested before. Looking a=
t
> the code again now, it should be possible make this change.
> Regardless, in the case of the numeric value error condition, it's th=
e
> same as the "past the end" string error condition: "Anything written
> beyond the maximum length of the value buffer will be ignored." i.e.
> anything other than file offset 0 is considered "past the end of the
> buffer" for a numeric value and is ignored.
>=20
>> But this seems not to be the case. Instead, the write() succeeds,
>> but the file is left unmodified. That's surprising, I find. So, I'm
>> wondering whether the implementation deviates from your intention.
>>
>> There's a test program below, which takes arguments as follows
>>
>>     ./a.out pathname offset string
>=20
> I have tests in tools/testing/selftests/sysctl for checking the
> various behaviors too. They don't actually examine any error
> conditions from the sysctl writing itself. It should be simple to mak=
e
> sysctl_writes_strict failures return an error, though.

So, what do you think: is it *desirable* to make sysctl_writes_strict
failures return an error?

>> And here's a test run that demonstrates the behavior:
>>
>> $ sudo sh -c "echo 1 > /proc/sys/kernel/sysctl_writes_strict"
>> $ cat /proc/sys/kernel/pid_max
>> 32768
>> $ sudo dmesg --clear
>> $ sudo ./a.out /proc/sys/kernel/pid_max 1 3000
>> write() succeeded (return value 4)
>> $ cat /proc/sys/kernel/pid_max
>> 32768
>> $ dmesg
>>
>> As you can see above, an attempt was made to write into the
>> /proc/sys/kernel/pid_max file at offset 1.
>> The write() returned successfully (reporting 4 bytes written)
>> but the file contents were unchanged, and no printk() warning
>> was issued. Is this intended behavior?
>>
>> =3D=3D=3D=3D=3D 2) Behavior puzzle (b) =3D=3D=3D=3D=3D
>>
>> In commit f88083005ab319abba5d0b2e4e997558245493c8, there is this no=
te:
>>
>>     This adds the sysctl kernel.sysctl_writes_strict to control the =
write
>>     behavior.  The default (0) reports when VFS position is non-0 on=
 a
>>     write, but retains legacy behavior, -1 disables the warning, and=
 1
>>     enables the position-respecting behavior.
>>
>>     The long-term plan here is to wait for userspace to be fixed in =
response
>>     to the new warning and to then switch the default kernel behavio=
r to the
>>     new position-respecting behavior.
>>
>> (That last para was added to the commit message by AKPM, I see.)
>>
>> But, I wonder here whether /proc/sys/kernel/sysctl_writes_strict=3D=3D=
0
>> is going to help with the long-term plan. The problem is that in
>> warn_sysctl_write(), pr_warn_once() is used. This means that only
>> the first offending user-space application that writes to *any*
>> /proc/sys file will generate the printk warning. If that application
>> isn't fixed, then none of the other "broken" applications will be
>> discovered. It therefore seems possible that it could be a very long
>> time before we could "switch the default kernel behavior to the
>> new position-respecting behavior".
>>
>> Looking over old mails
>> (http://thread.gmane.org/gmane.linux.kernel/1695177/focus=3D23240),
>> I see that you're aware of the problem, but it seems to me that
>> the switch to pr_warn_once() (for fear of spamming the log) likely
>> dooms the long-term plan to failure. Your thoughts?
>=20
> In actual regular use, the situation that triggers the warning should
> be vanishingly rare, but the condition can be trivially met by someon=
e
> intending to hit it for the purposes of filling log files. As such, i=
t
> makes sense to me to use _once to avoid spamming, but still catch a
> rare usage under normal conditions.

So, I'm not clear whether you think I'm wrong or not ;-).=20
Do you disagree with my point that this approach may doom
the long-term project to failure? (That was my main point.)

Cheers,

Michael


>> 8x--8x--8x--8x--8x--8x--8x--8x--8x--8x--8x--8x--8x--8x--8x--
>>
>> #include <sys/stat.h>
>> #include <fcntl.h>
>> #include <sys/types.h>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <unistd.h>
>> #include <string.h>
>>
>> #define errExit(msg) do { perror(msg); exit(EXIT_FAILURE); } while (=
0)
>>
>> int
>> main(int argc, char *argv[])
>> {
>>     char *pathname;
>>     off_t offset;
>>     char *string;
>>     int fd;
>>     ssize_t numWritten;
>>
>>     if (argc !=3D 4) {
>>         fprintf(stderr, "Usage: %s pathname offset string\n", argv[0=
]);
>>         exit(EXIT_FAILURE);
>>     }
>>
>>     pathname =3D argv[1];
>>     offset =3D strtoll(argv[2], NULL, 0);
>>     string =3D argv[3];
>>
>>     fd =3D open(pathname, O_RDWR);
>>     if (fd =3D=3D -1)
>>         errExit("open");
>>
>>     if (lseek(fd, offset, SEEK_SET) =3D=3D -1)
>>         errExit("lseek");
>>
>>     numWritten =3D write(fd, string, strlen(string));
>>     if (numWritten =3D=3D -1)
>>         errExit("write");
>>
>>     printf("write() succeeded (return value %zd)\n", numWritten);
>>
>>     exit(EXIT_SUCCESS);
>> }
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Linux/UNIX System Programming Training: http://man7.org/training/
>=20
>=20
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
