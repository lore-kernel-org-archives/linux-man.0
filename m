From: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Subject: Re: msr(7) manpage
Date: Tue, 24 Feb 2009 09:15:37 -0800
Message-ID: <49A42B39.2020607@zytor.com>
References: <20090222170549.GA23589@one.firstfloor.org>	 <cfd18e0f0902240140u464fdb95g25f9bb97a49cda63@mail.gmail.com> <cfd18e0f0902240144o3f1a9fbew57d880a484eb99de@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0902240144o3f1a9fbew57d880a484eb99de-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
>> Could you clarify "seek to the MSR number" == does that mean seek to
>> offset (MSR_number * 8) or something like that?

No, it means see to offset (MSR_number).

>>> as offset in the file and then read or write in chunks of 8 bytes.
>>> A larger size than 8 bytes means multiple reads or writes of the
>>> same register.
>> What are the semantics of reading the same register multiple times?
>> Is a read non-destructive?  Do the multiple reads always get the same
>> value?

The semantics are entirely dependent on the register itself.  Just like
an I/O device, anything can happen.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
