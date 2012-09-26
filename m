From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Interrogation about Global fix: use \\ rather than \e for literal backslash
Date: Wed, 26 Sep 2012 19:37:57 +0200
Message-ID: <CAMqf4EFCDS+p1azW3wN-ELuf7HKveNRs4uu-MA8wV1O6movovw@mail.gmail.com>
References: <k3vaf6$d0v$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <k3vaf6$d0v$1@ger.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2012/9/26 David Pr=C3=A9vot wrote:
> Hi,
>
> The 9f8e673e623d commit seems to brake stuff: =E2=80=9Cman man7/man.7=
=E2=80=9D displays
> the page until:
>
>    Predefined Strings
>        The man package has the following predefined strings:
>
> I.e. the first occurrence of =E2=80=9C.IP \\*R=E2=80=9D seems to brea=
k the page.

Hello,

All lines beginning with a dot are affected (man5/core.5 looks weird):
 man3/isalpha.3
 man3/sysconf.3
 man5/core.5
 man5/proc.5
 man7/man.7
 man7/mdoc.7
 man7/mdoc.samples.7

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
