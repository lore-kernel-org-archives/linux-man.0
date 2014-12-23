From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Missing "{" in perf_event_open's document
Date: Tue, 23 Dec 2014 16:31:19 +0100
Message-ID: <54998AC7.2050303@gmail.com>
References: <CACeBgBsJVfFok5sv1DnOqe-_yRTG6ERso-x2Z15NH1bRLsrQ6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACeBgBsJVfFok5sv1DnOqe-_yRTG6ERso-x2Z15NH1bRLsrQ6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?5bC55p2w?= <writalnaie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/18/2014 02:49 PM, =E5=B0=B9=E6=9D=B0 wrote:
> Hi all,
>=20
> I am a operating system researcher in Tsinghua University. I find tha=
t
> there is a missing "{" in the definition of struct read_format's inne=
r
> struct definition in the function perf_event_open
> <http://man7.org/linux/man-pages/man2/perf_event_open.2.html>'s docum=
ent :
>=20
>              struct read_format {
>                  u64 nr;            /* The number of events */
>                  u64 time_enabled;  /* if PERF_FORMAT_TOTAL_TIME_ENAB=
LED */
>                  u64 time_running;  /* if PERF_FORMAT_TOTAL_TIME_RUNN=
ING */
>                  struct
>                      u64 value;     /* The value of the event */
>                      u64 id;        /* if PERF_FORMAT_ID */
>                  } values[nr];
>              };
>=20
>=20
> should be
>=20
>              struct read_format {
>                  u64 nr;            /* The number of events */
>                  u64 time_enabled;  /* if PERF_FORMAT_TOTAL_TIME_ENAB=
LED */
>                  u64 time_running;  /* if PERF_FORMAT_TOTAL_TIME_RUNN=
ING */
>                  struct {
>                      u64 value;     /* The value of the event */
>                      u64 id;        /* if PERF_FORMAT_ID */
>                  } values[nr];
>              };

Hello Jie Yin,=20

Thanks for the report. I fixed the page as you suggest.

Cheers,

Michael
=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
