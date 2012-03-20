From: =?iso-8859-2?b?QmXyYXM=?= Petr <xbenas00-qjZHU19XGF/maGwbMATS8qVXKuFTiq87@public.gmane.org>
Subject: Re: [patch] Add get_nprocs.3 and get_nprocs_conf.3 manpages
Date: Tue, 20 Mar 2012 20:37:09 +0100
Message-ID: <20120320203709.148334rrqiz4nbz9@email.fit.vutbr.cz>
References: <20120218155621.11151qkmofi8hz4l@email.fit.vutbr.cz>
 <CAKgNAkg4wr668+88v2Jfhp0HdCXpQc5+tw_3Nevm8tap=DiUMw@mail.gmail.com>
 <20120320202934.15576814bclb08m6@email.fit.vutbr.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	DelSp=Yes	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120320202934.15576814bclb08m6-EjF/b22w83HKc17WfPUALesEoJ4y9sgM@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-2?b?QmXyYXM=?= Petr <xbenas00-qjZHU19XGF/maGwbMATS8qVXKuFTiq87@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kasparek-AzIEtyGJxgYp1Coe8Ar9gA@public.gmane.org, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello again,

I'm sorry, I made a typo in man3/get_nprocs_conf.3. Correct version of =
=20
patch follows. My apologies.

Petr

diff --git a/man3/get_nprocs.3 b/man3/get_nprocs.3
new file mode 100644
index 0000000..d85eda3
--- /dev/null
+++ b/man3/get_nprocs.3
@@ -0,0 +1,61 @@
+.\" Copyright (c) 2012, Petr Benas
+.\"
+.\" Permission is granted to make and distribute verbatim copies of th=
is
+.\" manual provided the copyright notice and this permission notice ar=
e
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of
+.\" this manual under the conditions for verbatim copying, provided th=
at
+.\" the entire resulting derived work is distributed under the terms o=
f
+.\" a permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume=
=2E
+.\" no responsibility for errors or omissions, or for damages resultin=
g.
+.\" from the use of the information contained herein.  The author(s) m=
ay.
+.\" not have taken the same level of care in the production of this.
+.\" manual, which is licensed free of charge, as they might when worki=
ng.
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied b=
y
+.\" the source, must acknowledge the copyright and authors of this wor=
k.
+
+.TH GET_NPROCS 3   2012-03-20 "GNU" "Linux Programmer's Manual"
+.SH NAME
+get_nprocs, get_nprocs_conf \- get number of processors available /
+configured by the operating system
+.SH SYNOPSIS
+.B #include <sys/sysinfo.h>
+.sp
+.BI "int get_nprocs(void);"
+.br
+.BI "int get_nprocs_conf(void);"
+.SH DESCRIPTION
+The function
+.BR get_nprocs ()
+returns the number of processors currently available in the system.
+The number returned can be affected by CPU logical hotplug.
+.sp
+The function
+.BR get_nprocs_conf ()
+returns the number of processors configured by the operating system.
+The number returned is not affected by CPU logical hotplug.
+.SH EXAMPLE
+Following is an example how
+.BR get_nprocs ()
+and
+.BR get_nprocs_conf ()
+can be used.
+
+.nf
+#include <stdio.h>
+#include <sys/sysinfo.h>
+
+int main(int argc, char *argv[])
+{
+    printf("This sytem has %d processors available and %d processors "=
 \\
+        "configured.\\n", get_nprocs(), get_nprocs_conf());
+    return 0;
+}
+.fi
+
diff --git a/man3/get_nprocs_conf.3 b/man3/get_nprocs_conf.3
new file mode 100644
index 0000000..e564531
--- /dev/null
+++ b/man3/get_nprocs_conf.3
@@ -0,0 +1,2 @@
+.so man3/get_nprocs.3
+


> Hi Michael,
>
> thanks for your valuable recommendations. Pages combined, under =20
> Verbatim license. Updated patch against latest manpages follows.
>
> Best regards
> Petr
>
> diff --git a/man3/get_nprocs.3 b/man3/get_nprocs.3
> new file mode 100644
> index 0000000..d85eda3
> --- /dev/null
> +++ b/man3/get_nprocs.3
> @@ -0,0 +1,61 @@
> +.\" Copyright (c) 2012, Petr Benas
> +.\"
> +.\" Permission is granted to make and distribute verbatim copies of =
this
> +.\" manual provided the copyright notice and this permission notice =
are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions o=
f
> +.\" this manual under the conditions for verbatim copying, provided =
that
> +.\" the entire resulting derived work is distributed under the terms=
 of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, th=
is
> +.\" manual page may be incorrect or out-of-date.  The author(s) assu=
me.
> +.\" no responsibility for errors or omissions, or for damages result=
ing.
> +.\" from the use of the information contained herein.  The author(s)=
 may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when wor=
king.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied=
 by
> +.\" the source, must acknowledge the copyright and authors of this w=
ork.
> +
> +.TH GET_NPROCS 3   2012-03-20 "GNU" "Linux Programmer's Manual"
> +.SH NAME
> +get_nprocs, get_nprocs_conf \- get number of processors available /
> +configured by the operating system
> +.SH SYNOPSIS
> +.B #include <sys/sysinfo.h>
> +.sp
> +.BI "int get_nprocs(void);"
> +.br
> +.BI "int get_nprocs_conf(void);"
> +.SH DESCRIPTION
> +The function
> +.BR get_nprocs ()
> +returns the number of processors currently available in the system.
> +The number returned can be affected by CPU logical hotplug.
> +.sp
> +The function
> +.BR get_nprocs_conf ()
> +returns the number of processors configured by the operating system.
> +The number returned is not affected by CPU logical hotplug.
> +.SH EXAMPLE
> +Following is an example how
> +.BR get_nprocs ()
> +and
> +.BR get_nprocs_conf ()
> +can be used.
> +
> +.nf
> +#include <stdio.h>
> +#include <sys/sysinfo.h>
> +
> +int main(int argc, char *argv[])
> +{
> +    printf("This sytem has %d processors available and %d processors=
 " \\
> +        "configured.\\n", get_nprocs(), get_nprocs_conf());
> +    return 0;
> +}
> +.fi
> +
> diff --git a/man3/get_nprocs_conf.3 b/man3/get_nprocs_conf.3
> new file mode 100644
> index 0000000..ed97505
> --- /dev/null
> +++ b/man3/get_nprocs_conf.3
> @@ -0,0 +1,2 @@
> +.so man3.get_nprocs_conf.3
> +
>
>
>
>> Hello Petr,
>>
>> Thanks for this patch. Could I ask you to resubmit, with the =20
>> following changes:
>>
>> * Combine the two functions into one page, get_nprocs.3
>> * Create a link file get_nprocs_conf.3
>>
>> In addition, would you be willing to submit this page under either t=
he
>> Verbatim license or GPLv2 (the former is my preference). I ask this
>> because no pages so far are licensed under GPLv3, and I'd like to
>> minimize the range of licenses used in the man-pages project.
>>
>> Thanks,
>>
>> Michael
>>
>> On Sun, Feb 19, 2012 at 3:56 AM, Be=F2as Petr =20
>> <xbenas00-qjZHU19XGF/maGwbMATS8qVXKuFTiq87@public.gmane.org> wrote:
>>> Greetings,
>>>
>>> I have created $subj manpages (both undocumented.3).
>>> Patch against latest git manpages version, information obtained fro=
m [1],
>>> [2] and testing on two x86_64 hosts.
>>>
>>> Best regards
>>> Petr Benas
>>>
>>> [1]
>>> http://www.gnu.org/software/libc/manual/html_node/Processor-Resourc=
es.html
>>> [2] http://sourceware.org/ml/libc-hacker/2004-03/msg00088.html
>>>
>>> diff --git a/man3/get_nprocs.3 b/man3/get_nprocs.3
>>> new file mode 100644
>>> index 0000000..e718ae5
>>> --- /dev/null
>>> +++ b/man3/get_nprocs.3
>>> @@ -0,0 +1,50 @@
>>> +.\" Copyright (c) 2012, Petr Benas
>>> +.\"
>>> +.\" This is free documentation; you can redistribute it and/or
>>> +.\" modify it under the terms of the GNU General Public License as
>>> +.\" published by the Free Software Foundation; either version 3 of
>>> +.\" the License, or (at your option) any later version.
>>> +.\"
>>> +.\" The GNU General Public License's references to "object code"
>>> +.\" and "executables" are to be interpreted as the output of any
>>> +.\" document formatting or typesetting system, including
>>> +.\" intermediate and printed output.
>>> +.\"
>>> +.\" This manual is distributed in the hope that it will be useful,
>>> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See th=
e
>>> +.\" GNU General Public License for more details.
>>> +.\"
>>> +.\" You should have received a copy of the GNU General Public
>>> +.\" License along with this manual; if not, see
>>> +.\" <http://www.gnu.org/licenses/>.
>>> +.TH GET_NPROCS 3 =A0 2012-02-18 "GNU" "Linux Programmer's Manual"
>>> +.SH NAME
>>> +get_nprocs \- get number of processors available
>>> +.SH SYNOPSIS
>>> +.B #include <sys/sysinfo.h>
>>> +.sp
>>> +.BI "int get_nprocs(void);"
>>> +.SH DESCRIPTION
>>> +The function
>>> +.BR get_nprocs ()
>>> +returns the number of processors currently available in the system=
=2E
>>> +The number returned can be affected by CPU logical hotplug.
>>> +.SH EXAMPLE
>>> +Following is an example how
>>> +.BR get_nprocs ()
>>> +can be used.
>>> +
>>> +.nf
>>> +#include <stdio.h>
>>> +#include <sys/sysinfo.h>
>>> +
>>> +int main(int argc, char *argv[])
>>> +{
>>> + =A0 =A0printf("This sytem has %d processors available.\\n", get_n=
procs());
>>> + =A0 =A0return 0;
>>> +}
>>> +.fi
>>> +.SH "SEE ALSO"
>>> +.BR get_nprocs_conf (3)
>>> +
>>> diff --git a/man3/get_nprocs_conf.3 b/man3/get_nprocs_conf.3
>>> new file mode 100644
>>> index 0000000..990ca51
>>> --- /dev/null
>>> +++ b/man3/get_nprocs_conf.3
>>> @@ -0,0 +1,50 @@
>>> +.\" Copyright (c) 2012, Petr Benas
>>> +.\"
>>> +.\" This is free documentation; you can redistribute it and/or
>>> +.\" modify it under the terms of the GNU General Public License as
>>> +.\" published by the Free Software Foundation; either version 3 of
>>> +.\" the License, or (at your option) any later version.
>>> +.\"
>>> +.\" The GNU General Public License's references to "object code"
>>> +.\" and "executables" are to be interpreted as the output of any
>>> +.\" document formatting or typesetting system, including
>>> +.\" intermediate and printed output.
>>> +.\"
>>> +.\" This manual is distributed in the hope that it will be useful,
>>> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See th=
e
>>> +.\" GNU General Public License for more details.
>>> +.\"
>>> +.\" You should have received a copy of the GNU General Public
>>> +.\" License along with this manual; if not, see
>>> +.\" <http://www.gnu.org/licenses/>.
>>> +.TH GET_NPROCS_CONF 3 =A0 2012-02-18 "GNU" "Linux Programmer's Man=
ual"
>>> +.SH NAME
>>> +get_nprocs_conf \- get number of processors configured by the oper=
ating
>>> system
>>> +.SH SYNOPSIS
>>> +.B #include <sys/sysinfo.h>
>>> +.sp
>>> +.BI "int get_nprocs_conf(void);"
>>> +.SH DESCRIPTION
>>> +The function
>>> +.BR get_nprocs_conf ()
>>> +returns the number of processors configured by the operating syste=
m.
>>> +The number returned is not affected by CPU logical hotplug.
>>> +.SH EXAMPLE
>>> +Following is an example how
>>> +.BR get_nprocs_conf ()
>>> +can be used.
>>> +
>>> +.nf
>>> +#include <stdio.h>
>>> +#include <sys/sysinfo.h>
>>> +
>>> +int main(int argc, char *argv[])
>>> +{
>>> + =A0 =A0printf("This sytem has %d processors configured.\\n",
>>> get_nprocs_conf());
>>> + =A0 =A0return 0;
>>> +}
>>> +.fi
>>> +.SH "SEE ALSO"
>>> +.BR get_nprocs (3)
>>> +
>>>
>>>
>>
>>
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Author of "The Linux Programming Interface"; http://man7.org/tlpi/
>>
>
>
>



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
