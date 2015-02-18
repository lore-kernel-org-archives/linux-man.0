From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: character set encoding problem
Date: Wed, 18 Feb 2015 12:06:28 +0000
Message-ID: <CAGc9EvcLxpbpeZ3Ukpvgy7tTGATzmqDuYRQtJx-jVSZLKaOXag@mail.gmail.com>
References: <CAGc9EvfsUTNNbnE_130qrB-sJ5CuNn8BPh3ozYMVbHZ=VrHpEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EvfsUTNNbnE_130qrB-sJ5CuNn8BPh3ozYMVbHZ=VrHpEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello

I heard back from W3C group I queried:

The character before the URL is U+27E8 MATHEMATICAL LEFT ANGLE
BRACKET, which is E2 9F A in UTF-8 encoding; see
http://www.fileformat.info/info/unicode/char/27e8/index.htm
And the character after the URL is U+27E9 MATHEMATICAL RIGHT ANGLE BRACKET.

While not illegal, it is not the regular < > that is used. I wonder if
it was pasted from a mathematical wordprocessor.


On 16 February 2015 at 17:41, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello MTK
>
> I saw a problem in the encoding on this page
>
> http://man7.org/linux/man-pages/man1/hostname.1.html
>
> See text below with ??
>
>
> Information about the project can be found at
>        ??http://net-tools.sourceforge.net/??.  If you have a bug report for
>        this manual page, see ??http://net-tools.sourceforge.net/??.
>
>
> The bytes seem to be some multi byte E2 9F A8
>
> Regards, Jonny



-- 
Jonny  jg-hus3n9K41k0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
