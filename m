From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Tue, 17 Jun 2014 07:47:12 +0200
Message-ID: <539FD660.7080503@gmail.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>	<CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>	<52FACFBB.6070607@cn.fujitsu.com>	<CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg@mail.gmail.com>	<CAKgNAkix8vTrKEV_vicpD2yH88NQmiSrMR9dgKoQ1u2NkqZexA@mail.gmail.com>	<CAE2sS1gZJCZdEhY7hpF8=dP069JFTyxD-B-nY9va0OTFV8jN4w@mail.gmail.com>	<CAKgNAkh029iy5=7+N1RiA1_X9Zeiv_coci59bFN1y-oQmOJykA@mail.gmail.com>	<CAE2sS1j4sLeczF_gR94+mZ89bi-C=RMMikE=_cOvu9id7v5sHw@mail.gmail.com>	<CAKgNAkj0b=-5EMqEWvxoq4_qfTH2wNOatkBmqVrXq5dOuQNHmw@mail.gmail.com>	<CAKgNAki5UXmOTa=SW1GEYZTP1f5uMiTsrbkcYN+MuYZf6mA0qw@mail.gmail.com> <CAKgNAkgDFuwXDD=Rjn3KAutyuOAy_-71imhR5UGZOS9fcMSnew@mail.gmail.com> <539E6A32.7080605@gmail.com> <539EA198.9090309@cn.fujitsu.com> <539FD4D3.40
 10406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <539FD4D3.4010406-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/17/2014 07:40 AM, Michael Kerrisk (man-pages) wrote:
> On 06/16/2014 09:49 AM, Peng Haitao wrote:
>>
>> On 06/16/2014 11:53 AM, Michael Kerrisk (man-pages) wrote:
>>> Hello Haitao and Qian Lei,
>>>
>>> Any thoughts on the changes proposed in that Git branch (see below).
>>>
>>
>> Sorry for the late reply. 
>>
>>>>> Okay -- take a look[1] at the change in the 'attributes_reformat'
>>>>> branch that I've just pushed. That tries to cover a representative
>>>>> sampling of the changes that I think we need to make. In particular,
>>>>> the changed pages are:
>>>>>
>>>>>     a64l.3
>>>>>     abort.3
>>>>>     abs.3
>>>>>     atof.3
>>>>>     bindresvport.3
>>>>>     drand48.3
>>>>>     fenv.3
>>>>>
>>>>> Does this seem okay?
>>>>>
>>
>> Well done, thanks.
> 
> Good. Could I ask you and Qian Lei to submit future patches in that format.

Hello Haitao, Qian Lei,

I meant also to add that I'll think about a plan of how we could update the 
existing pages. Would either of you have any time to help with this task?

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
