From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Interrogation about Global fix: use \\ rather than \e for literal backslash
Date: Wed, 26 Sep 2012 23:59:04 +0200
Message-ID: <CAKgNAkgpRC69oHn=5EKzRqm8sO4CuLdWr9BPmgQgHQJG-UyGtA@mail.gmail.com>
References: <k3vaf6$d0v$1@ger.gmane.org> <CAMqf4EFCDS+p1azW3wN-ELuf7HKveNRs4uu-MA8wV1O6movovw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EFCDS+p1azW3wN-ELuf7HKveNRs4uu-MA8wV1O6movovw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Sep 26, 2012 at 7:37 PM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 2012/9/26 David Pr=E9vot wrote:
>> Hi,
>>
>> The 9f8e673e623d commit seems to brake stuff: =93man man7/man.7=94 d=
isplays
>> the page until:
>>
>>    Predefined Strings
>>        The man package has the following predefined strings:
>>
>> I.e. the first occurrence of =93.IP \\*R=94 seems to break the page.

I've applied 31a6818e3c72e0f9f0e67c0fbd90c1f899bee11d, which I think
reverts all the changes in the bad commit. Look okay now?

Thanks,

Michael


> Hello,
>
> All lines beginning with a dot are affected (man5/core.5 looks weird)=
:
>  man3/isalpha.3
>  man3/sysconf.3
>  man5/core.5
>  man5/proc.5
>  man7/man.7
>  man7/mdoc.7
>  man7/mdoc.samples.7
>
> Denis



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
