From: Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mkdir.2: Add EMLINK error
Date: Sat, 26 Jun 2010 12:15:47 +0530
Message-ID: <AANLkTilbnMsscImEL4HKun-sZVXOmjGTpGJ1lylwBk-Q@mail.gmail.com>
References: <AANLkTilRbs4OTZxAdH_XDZB_EeQDXiKp2kflmO8djV8j@mail.gmail.com>
	<AANLkTingDQui6HBFX3A3yh7Nhy00YJN1-j9aox88rROz@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTingDQui6HBFX3A3yh7Nhy00YJN1-j9aox88rROz-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

ping ...



On Thu, Jun 24, 2010 at 10:22 AM, Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> Hi,
>
> A quick google search shows that the sus v3 version of mkdir(2) has
> reference to EMLINK error
>
> http://www.opengroup.org/onlinepubs/000095399/functions/mkdir.html
> "
> [EMLINK]
> =A0 =A0The link count of the parent directory would exceed {LINK_MAX}=
=2E
> "
> Please let me know your opinion on this.
>
> Best Regards,
> Maxin B. John
>
> On Mon, Jun 21, 2010 at 9:18 PM, Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
>> Dear Michael,
>>
>> While executing the below given program in ext3 file system, I came
>> across the EMLINK error in mkdir(2) syscall.
>>
>> # cat test_max_directories.c
>>
>> #include <stdio.h>
>> #include <sys/stat.h>
>> #include <fcntl.h>
>> #include <stdlib.h>
>> #include <errno.h>
>>
>> int main()
>> {
>> =A0 =A0char dirname[50];
>> =A0 =A0int i;
>> =A0 =A0/* The max number of subdirectories in one directory for ext3=
 is 32000 */
>> =A0 =A0int limit =3D 32001;
>>
>> =A0 =A0for (i =3D 0; i < limit; i++) {
>> =A0 =A0 =A0 =A0sprintf(dirname, "testdir%d", i);
>> =A0 =A0 =A0 =A0if ((mkdir(dirname, 00777)) =3D=3D -1) {
>> =A0 =A0 =A0 =A0 =A0 =A0perror("Error in creating directory!");
>> =A0 =A0 =A0 =A0 =A0 =A0printf("errno =3D %d\n", errno);
>> =A0 =A0 =A0 =A0 =A0 =A0exit(1);
>> =A0 =A0 =A0 =A0}
>> =A0 =A0}
>> =A0 =A0return 0;
>> }
>>
>>
>> # ./a.out
>> Error in creating directory!: Too many links
>> errno =3D 29
>>
>> An strace of this execution shows that the mkdir(2) call generates a=
n
>> EMLINK error when it reaches the limit of =A0maximum number of sub
>> directories in one directory
>>
>> #strace ./a.out
>> -----------------------------------
>> .....
>> mkdir("testdir31998", 0777) =A0 =A0 =A0 =A0 =A0 =A0 =3D -1 EMLINK (T=
oo many links)
>> dup(2) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=3D 3
>> fcntl64(3, F_GETFL) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D 0x80=
02 (flags O_RDWR|O_LARGEFILE)
>> brk(0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=3D 0x804a000
>> brk(0x806b000) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D=
 0x806b000
>> fstat64(3, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(136, 2), ...})=
 =3D 0
>> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -=
1,
>> 0) =3D 0xb7f71000
>> _llseek(3, 0, 0xbffc3078, SEEK_CUR) =A0 =A0 =3D -1 ESPIPE (Illegal s=
eek)
>> write(3, "Error in creating directory!: To"..., 45Error in creating
>> directory!: Too many links
>> ) =3D 45
>> close(3) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=3D 0
>> munmap(0xb7f71000, 4096) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0
>> fstat64(1, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(136, 2), ...})=
 =3D 0
>> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -=
1,
>> 0) =3D 0xb7f71000
>> write(1, "errno =3D 29\n", 11errno =3D 29
>> ) =A0 =A0 =A0 =A0 =A0 =A0=3D 11
>> exit_group(1) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D=
 ?
>> Process 16246 detached
>> -----------------------------------
>>
>> However, reference to EMLINK is not present in the mkdir(2) man page=
=2E
>> The following patch adds the EMLINK error in the man page of mkdir(2=
).
>>
>> Kindly let me know if there are any issues.
>>
>> Best Regards,
>> Maxin B. John
>> www.maxinbjohn.info
>>
>> Signed-off-by: Maxin B. John <maxinbjohn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> -------
>>
>> diff --git a/man2/mkdir.2 b/man2/mkdir.2
>> index e6cb28c..d01bafd 100644
>> --- a/man2/mkdir.2
>> +++ b/man2/mkdir.2
>> @@ -73,6 +73,10 @@ is a symbolic link, dangling or not.
>> =A0Too many symbolic links were encountered in resolving
>> =A0.IR pathname .
>> =A0.TP
>> +.B EMLINK
>> +The new directory cannot be created because the number of sub direc=
tories
>> +in a directory is limited to LINK_MAX defined by the file system.
>> +.TP
>> =A0.B ENAMETOOLONG
>> =A0.IR pathname " was too long."
>> =A0.TP
>>
>> -------
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
