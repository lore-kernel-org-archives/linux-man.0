From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Interrogation about Global fix: use \\ rather than \e for literal backslash
Date: Thu, 27 Sep 2012 06:48:19 +0200
Message-ID: <CAMqf4EGG3vhdf2YD0Afeu8yTKZbMAvXUVyatiFS51JxWvm8sgg@mail.gmail.com>
References: <k3vaf6$d0v$1@ger.gmane.org> <CAMqf4EFCDS+p1azW3wN-ELuf7HKveNRs4uu-MA8wV1O6movovw@mail.gmail.com>
 <CAKgNAkgpRC69oHn=5EKzRqm8sO4CuLdWr9BPmgQgHQJG-UyGtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgpRC69oHn=5EKzRqm8sO4CuLdWr9BPmgQgHQJG-UyGtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 2012/9/26 Michael Kerrisk (man-pages) wrote:
> On Wed, Sep 26, 2012 at 7:37 PM, D. Barbier wrote:
>> On 2012/9/26 David Pr=C3=A9vot wrote:
>>> Hi,
>>>
>>> The 9f8e673e623d commit seems to brake stuff: =E2=80=9Cman man7/man=
=2E7=E2=80=9D displays
>>> the page until:
>>>
>>>    Predefined Strings
>>>        The man package has the following predefined strings:
>>>
>>> I.e. the first occurrence of =E2=80=9C.IP \\*R=E2=80=9D seems to br=
eak the page.
>
> I've applied 31a6818e3c72e0f9f0e67c0fbd90c1f899bee11d, which I think
> reverts all the changes in the bad commit. Look okay now?

Perfect, thanks.

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
