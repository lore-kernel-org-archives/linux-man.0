From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Thu, 12 Jun 2014 13:27:14 +0200
Message-ID: <CAKgNAki5UXmOTa=SW1GEYZTP1f5uMiTsrbkcYN+MuYZf6mA0qw@mail.gmail.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>
 <CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>
 <52FACFBB.6070607@cn.fujitsu.com> <CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg@mail.gmail.com>
 <CAKgNAkix8vTrKEV_vicpD2yH88NQmiSrMR9dgKoQ1u2NkqZexA@mail.gmail.com>
 <CAE2sS1gZJCZdEhY7hpF8=dP069JFTyxD-B-nY9va0OTFV8jN4w@mail.gmail.com>
 <CAKgNAkh029iy5=7+N1RiA1_X9Zeiv_coci59bFN1y-oQmOJykA@mail.gmail.com>
 <CAE2sS1j4sLeczF_gR94+mZ89bi-C=RMMikE=_cOvu9id7v5sHw@mail.gmail.com> <CAKgNAkj0b=-5EMqEWvxoq4_qfTH2wNOatkBmqVrXq5dOuQNHmw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkj0b=-5EMqEWvxoq4_qfTH2wNOatkBmqVrXq5dOuQNHmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jun 11, 2014 at 10:31 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Carlos,
>
> On Wed, Jun 11, 2014 at 4:59 PM, Carlos O'Donell
> <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org> wrote:
>> On Wed, Jun 11, 2014 at 4:30 AM, Michael Kerrisk (man-pages)
>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hi Carlos, Haitao, Qian Lei, Alex,
[...]
>>> Does one of those approaches eem okay? Haitao, Qian Lei, what do you
>>> think? (I appreciate that there's a lot of pages to be fixed to follow
>>> this new approach: I'd do that, though you could help if you want.)
>>
>> I agree with Peng, I like the first approach of a single table.
>
> Alrighty, I need to hack a few of the pages to see that this approach
> works, and then we can make the change wholesale.

Okay -- take a look[1] at the change in the 'attributes_reformat'
branch that I've just pushed. That tries to cover a representative
sampling of the changes that I think we need to make. In particular,
the changed pages are:

    a64l.3
    abort.3
    abs.3
    atof.3
    bindresvport.3
    drand48.3
    fenv.3

Does this seem okay?

>> We should also evaluate the approach of adding the glibc version to
>> the table if and when the version change would change the result e.g.
>> the table lists the historical values.
>
> Good point. I'll give that a little thought.

Take a look at bindresvport.3 for an example of how we might deal with
these cases.

Cheers,

Michael

[1]   $ git pull
      $ git checkout remotes/origin/attributes_reformat

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
