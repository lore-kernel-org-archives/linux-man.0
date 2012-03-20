From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] Add get_nprocs.3 and get_nprocs_conf.3 manpages
Date: Wed, 21 Mar 2012 06:39:11 +1300
Message-ID: <CAKgNAkg4wr668+88v2Jfhp0HdCXpQc5+tw_3Nevm8tap=DiUMw@mail.gmail.com>
References: <20120218155621.11151qkmofi8hz4l@email.fit.vutbr.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120218155621.11151qkmofi8hz4l-EjF/b22w83HKc17WfPUALesEoJ4y9sgM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Be=C5=88as_Petr?= <xbenas00-qjZHU19XGF/maGwbMATS8qVXKuFTiq87@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kasparek-AzIEtyGJxgYp1Coe8Ar9gA@public.gmane.org, Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Petr,

Thanks for this patch. Could I ask you to resubmit, with the following =
changes:

* Combine the two functions into one page, get_nprocs.3
* Create a link file get_nprocs_conf.3

In addition, would you be willing to submit this page under either the
Verbatim license or GPLv2 (the former is my preference). I ask this
because no pages so far are licensed under GPLv3, and I'd like to
minimize the range of licenses used in the man-pages project.

Thanks,

Michael

On Sun, Feb 19, 2012 at 3:56 AM, Be=C5=88as Petr <xbenas00-qjZHU19XGF94l0G7Z9RwYQ@public.gmane.org=
br.cz> wrote:
> Greetings,
>
> I have created $subj manpages (both undocumented.3).
> Patch against latest git manpages version, information obtained from =
[1],
> [2] and testing on two x86_64 hosts.
>
> Best regards
> Petr Benas
>
> [1]
> http://www.gnu.org/software/libc/manual/html_node/Processor-Resources=
=2Ehtml
> [2] http://sourceware.org/ml/libc-hacker/2004-03/msg00088.html
>
> diff --git a/man3/get_nprocs.3 b/man3/get_nprocs.3
> new file mode 100644
> index 0000000..e718ae5
> --- /dev/null
> +++ b/man3/get_nprocs.3
> @@ -0,0 +1,50 @@
> +.\" Copyright (c) 2012, Petr Benas
> +.\"
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 3 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See t=
he
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, see
> +.\" <http://www.gnu.org/licenses/>.
> +.TH GET_NPROCS 3 =C2=A0 2012-02-18 "GNU" "Linux Programmer's Manual"
> +.SH NAME
> +get_nprocs \- get number of processors available
> +.SH SYNOPSIS
> +.B #include <sys/sysinfo.h>
> +.sp
> +.BI "int get_nprocs(void);"
> +.SH DESCRIPTION
> +The function
> +.BR get_nprocs ()
> +returns the number of processors currently available in the system.
> +The number returned can be affected by CPU logical hotplug.
> +.SH EXAMPLE
> +Following is an example how
> +.BR get_nprocs ()
> +can be used.
> +
> +.nf
> +#include <stdio.h>
> +#include <sys/sysinfo.h>
> +
> +int main(int argc, char *argv[])
> +{
> + =C2=A0 =C2=A0printf("This sytem has %d processors available.\\n", g=
et_nprocs());
> + =C2=A0 =C2=A0return 0;
> +}
> +.fi
> +.SH "SEE ALSO"
> +.BR get_nprocs_conf (3)
> +
> diff --git a/man3/get_nprocs_conf.3 b/man3/get_nprocs_conf.3
> new file mode 100644
> index 0000000..990ca51
> --- /dev/null
> +++ b/man3/get_nprocs_conf.3
> @@ -0,0 +1,50 @@
> +.\" Copyright (c) 2012, Petr Benas
> +.\"
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 3 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See t=
he
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, see
> +.\" <http://www.gnu.org/licenses/>.
> +.TH GET_NPROCS_CONF 3 =C2=A0 2012-02-18 "GNU" "Linux Programmer's Ma=
nual"
> +.SH NAME
> +get_nprocs_conf \- get number of processors configured by the operat=
ing
> system
> +.SH SYNOPSIS
> +.B #include <sys/sysinfo.h>
> +.sp
> +.BI "int get_nprocs_conf(void);"
> +.SH DESCRIPTION
> +The function
> +.BR get_nprocs_conf ()
> +returns the number of processors configured by the operating system.
> +The number returned is not affected by CPU logical hotplug.
> +.SH EXAMPLE
> +Following is an example how
> +.BR get_nprocs_conf ()
> +can be used.
> +
> +.nf
> +#include <stdio.h>
> +#include <sys/sysinfo.h>
> +
> +int main(int argc, char *argv[])
> +{
> + =C2=A0 =C2=A0printf("This sytem has %d processors configured.\\n",
> get_nprocs_conf());
> + =C2=A0 =C2=A0return 0;
> +}
> +.fi
> +.SH "SEE ALSO"
> +.BR get_nprocs (3)
> +
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
