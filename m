From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] charsets.7: update to reflect past developments
Date: Tue, 10 Jun 2014 11:42:58 +0300
Message-ID: <5396C512.4080500@redhat.com>
References: <538EB3E0.5050600@redhat.com> <538FF7FC.2030409@gmail.com> <5390319E.6040106@redhat.com> <53906217.1090702@gmail.com> <5390965A.60501@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5390965A.60501-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Starner <dstarner98-RXPF2eSzNizNLxjTenLetw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On 2014-06-05 19:10, Marko Myllynen wrote:
> On 2014-06-05 15:27, Michael Kerrisk (man-pages) wrote:
>>
>>>  .TP
>>>  8859-8
>>>  Supports modern Hebrew without niqud (punctuation signs).
>>> -Niqud and full-fledged Biblical Hebrew are outside the scope of this
>>> -character set; under Linux, UTF-8 is the preferred encoding for
>>> -these.
>>
>> Why remove this piece "under Linux, UTF-8...".
> 
> hmm, good question

for the record, we decided to drop this after all, it avoids to give any
impression that UTF-8 would not be preferred for all of them.

Cheers,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
