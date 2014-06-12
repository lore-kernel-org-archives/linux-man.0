From: "Carlos O'Donell" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Thu, 12 Jun 2014 10:02:45 -0400
Message-ID: <CAE2sS1iaG3CG2Zc-jsJQRBfRQi-AcM2zOyvTFNUtkYEZDoe4iw@mail.gmail.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>
	<CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>
	<52FACFBB.6070607@cn.fujitsu.com>
	<CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg@mail.gmail.com>
	<CAKgNAkix8vTrKEV_vicpD2yH88NQmiSrMR9dgKoQ1u2NkqZexA@mail.gmail.com>
	<CAE2sS1gZJCZdEhY7hpF8=dP069JFTyxD-B-nY9va0OTFV8jN4w@mail.gmail.com>
	<CAKgNAkh029iy5=7+N1RiA1_X9Zeiv_coci59bFN1y-oQmOJykA@mail.gmail.com>
	<CAE2sS1j4sLeczF_gR94+mZ89bi-C=RMMikE=_cOvu9id7v5sHw@mail.gmail.com>
	<CAKgNAkj0b=-5EMqEWvxoq4_qfTH2wNOatkBmqVrXq5dOuQNHmw@mail.gmail.com>
	<CAKgNAki5UXmOTa=SW1GEYZTP1f5uMiTsrbkcYN+MuYZf6mA0qw@mail.gmail.com>
	<CAKgNAkgDFuwXDD=Rjn3KAutyuOAy_-71imhR5UGZOS9fcMSnew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgDFuwXDD=Rjn3KAutyuOAy_-71imhR5UGZOS9fcMSnew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Jun 12, 2014 at 8:16 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> [1]   $ git pull
>>       $ git checkout remotes/origin/attributes_reformat
>
> For good measure, I also added
>
>     pthread_setcancelstate.3
>
> to show two different attribute types in a table.

Looks amazing. Exactly the right way forward. Wicked job.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
