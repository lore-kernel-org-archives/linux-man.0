From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pow(3): warn against ineffecient uses?
Date: Mon, 10 Apr 2017 14:13:32 +0200
Message-ID: <ebb70e49-3a71-5e64-a77f-93548150e606@gmail.com>
References: <ee3b127b-5e9e-e82d-1731-172185c8ebd2@fz-juelich.de>
 <871stdn197.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <871stdn197.fsf-ZqZwdwZz9NfTBotR3TxKnbNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fw-d32yF4oPJVt0XxTmqZlbVQ@public.gmane.org>, Joachim Wuttke <j.wuttke-97/bSmCnXvjoK6nBLMlh1Q@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/31/2017 01:17 PM, Florian Weimer wrote:
> * Joachim Wuttke:
> 
>> Maybe it would be appropriate to warn against inefficient
>> uses of the function pow. To make a very first proposal
>> for a paragraph to be added to pow(3):
>>
>> In time-critical code, pow with small integer or simple
>> fractional exponents should be avoided in favor of
>> straightforward multiplication, division or square or
>> cubic roots: prefer x*x over pow(x,2), 1/x over pow(x,-1),
>> sqrt(x) over pow(x,0.5), or cbrt(x*x) over pow(x,2.0/3).
> 
> I don't think transforming pow (x, 2.0 / 3) to cbrt (x * x) is correct
> because the result is not correctly rounded.  I'm not sure if it is a
> good idea to add those examples to the manual page without discussing
> the cases where the transformations might not be valid.
> 
> If GCC does not handle some of the common cases from real-world code,
> that could be fixed in GCC (and GCC can do more transformations under
> -ffast-math, too).

Thanks, Florian, for jumping in on this. I don't have enough
knowledge of these details, so your comments help a lot. Lacking
any further refinement, I'll drop this proposed change for now.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
