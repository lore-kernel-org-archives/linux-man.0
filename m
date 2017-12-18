From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fwd: Missing { in sigaltstack example code
Date: Mon, 18 Dec 2017 17:11:21 +0100
Message-ID: <d507443b-be63-9116-ab11-a63c0216c95c@gmail.com>
References: <CAJJ5kavLdD33orcz4fDHcBwAM_T0RD8Xaja78vdBe2x8=wHbKw@mail.gmail.com>
 <CAJJ5katC1h_cpoZRuzUNybeaD+3FBxjFtK9v7GFXCms7kd3bYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJJ5katC1h_cpoZRuzUNybeaD+3FBxjFtK9v7GFXCms7kd3bYQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie Roudninski <xademax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Élie,

On 12/17/2017 06:55 PM, Elie Roudninski wrote:
> Hello Michael,
> 
> I noticed a small typo in the man page of sigaltstack in the example
> section, a { is missing :
> http://man7.org/linux/man-pages/man2/sigaltstack.2.html
> 
> I believe :
> 
>> if (sigaltstack(&ss, NULL) == -1)
>>     perror("sigaltstack");
>>     exit(EXIT_FAILURE);
>> }
> 
> should be :
> 
>> if (sigaltstack(&ss, NULL) == -1) {
>>     perror("sigaltstack");
>>     exit(EXIT_FAILURE);
>> }

Thanks. Fixed now.

> See you next year, and thank you for maintaining the manpages :)
> 
> Best regards,
> 
> Elie ROUDNINSKI
> 
> P.S : sorry for previous email with HTML ...

No problem. See you next year!

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
