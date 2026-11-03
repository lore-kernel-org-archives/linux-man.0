Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728931;
	b=GxFhWrf4qaYmAaRBwJeWog1W+g+maavVk1ayHZkXrRPspRXMoOI6EijB00NH2GhIw8uK
	 GS0OUcVqS2P0qCucNyXPc1ZmqXYBbOT/f4mCEV98dxwr7Nqfk4af7jtXmUIV2KjjL+PDB
	 9UD9YmKC3S8gLYsyMaBz7ezqIceQLyACI8OHiZrT5ALAYmszako1CXu2o+qK/JMq/otk8
	 TqQvtSBkOHwHYc+gSXAvyUZCts5tVKXzUk624cOcJ/4lBZ6eJCci8fHW9p5UClF29oz+M
	 bYjCeLO2cEyN64YTXqCiGui0aOnliQuBsoAWh4hTwa6HW+kdHVgjr5ak7nvhJbiFqMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728931;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=viu6WgVws86dTGC0sqgPkTJylB9V2EaAil/JOFs4r/U=;
	b=GzNQp/x4q1vEvsTRPoHlwn9wV71eMWt/AzNaVbQdik6OLfyq0E2xYrhmQaYvkZbIYh/8
	 kWmxVMYe+gt7aoxAJSSjps5tlojf7/yj/4EowcSK/JDwiaD4zS010wHV9Bd0KT7IM4bwK
	 jEGUrBYEQmUrxp4U4m0n6WmQbGiTKhyhJTo8vPMcqdoQpg9FIYf+obc5Cxi8owT0n3UEW
	 bnqngsH1euRALViY7wI3svZtsUEhzQm0/QEFJCxZ+9jK/jvQoY34vR7jABPILqRgxF+zN
	 TLjTetdT0s7tlkG77eq9S21PwwsZIdx7Om9rU7u4gzy9zzTJUwNQ0bXiW7fvpDR6/Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+2mTw4D;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Tdx0R1km;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82496606A328
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 18:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82496606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+2mTw4D;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Tdx0R1km
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793728929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=viu6WgVws86dTGC0sqgPkTJylB9V2EaAil/JOFs4r/U=;
	b=O+2mTw4DGdENAJtl/Pn2LX4CApbTXMUMV26cv6aw2RvGYUg1JJHlidhRx6xjqfaHD8s/O6
	Op/Q+ZntEvQk20p92acwCOdhLmnsd0HCaVnmVmF/IPNBapR3XJ+XJ7zYj3w6u+/OrQg3rq
	Gtfz74/+iOV9UAwLmY58tjH4IMKQdHg=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-8kaOC2FcOb67QIm0lgHsgQ-1; Tue, 03 Nov 2026 13:02:08 -0500
X-MC-Unique: 8kaOC2FcOb67QIm0lgHsgQ-1
X-Mimecast-MFC-AGG-ID: 8kaOC2FcOb67QIm0lgHsgQ_1793728927
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67be6a8f47cso752858d50.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 10:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793728927; x=1794333727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=viu6WgVws86dTGC0sqgPkTJylB9V2EaAil/JOFs4r/U=;
        b=Tdx0R1kmbDA/PxNlQmF5SN8qMMe2ohmSxtQNflWxyoXriLgT8QD4mkaZS45JTd/0mI
         wecVrAl5hzwkrNkxmuP8AOwUSUpFvWtDXeT5bJWD9ZZWiwX679N+1EaCLU+nSx4/aUTF
         a76OyBOUz1tjHTvhUTQm/z2MWSWHlOhf/mF+EHIomMY5HAmziJ/SaQGrG6SC+T2C+idp
         WaQ2Q5tA0xy8X6x0VtdOA20xKv0MG0PdYEWNjpOnA0r8qIyrII5SJBHy9zc5uKYIHaiG
         4D0ATuX8obYxBCI8r6dKQvixQlbUdSz1Tp2XZxWlo/K2gRkaB/gtU0VWqqwHB91nFMu6
         rMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728927; x=1794333727;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=viu6WgVws86dTGC0sqgPkTJylB9V2EaAil/JOFs4r/U=;
        b=SU3j5qNhimez+/pVc2d08vAl531WQH1+S6H5qpIABHfCyO/QU143F4QmKCJCfZGeHn
         uIfjqyK5MEvbY2HHCY6X+Ju6AT0EGIUhwjPxb9v16B1GGGTYZ6M6Sj/b6JQw3bg0y6SQ
         Ef+/Je0DDThcKYv9WpF06jrdV3cEZR/hg+5u3GGk2euPr2Mdh5+MoenSwerfpoNsIkKW
         nOOgg9NYu7OUQUwTtIg4za9/nnyMLySQFjiyU3U/tDNscp8JL93i/sU5trhWGDHHsPxn
         wrWdkpLZgun0z3HHo3tj2PjPCJ+xL2Z4balndJSLLr4ewS7O6xg/R9q30y0doK3xh8Sz
         MeoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGomlvzP3fEjJAc/V1XYBz/LfIFKlHm6HmwxzZJQpjJy0FHgqtEcevO8xkQsR+rFpP2u4zT9+hk1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uQ632dux2wvHZ9SnoSvXoogCqM0T9iTasI1L20wWK/q95D1bC
	5WfF+C/6eDNifKjsA2HPJBMP/HRkE0EOoJEPkgYOnU11OHlwjHFMGamUIF/FkNyeGIFyMA6swyE
	mI260vo6uO1l0TtKXd28FP9XBYA89qBsVcV39KhGCK39mzqFLZbyiERjMPj1y9w==
X-Gm-Gg: AYBFou0Ze4PQeMOM2eEsHuQBAd4iWE5lBhMEW0vgAA/TcEqWoNdbsLaA4plMGPCGrhu
	R0v1LVASK18nrSO9MNkaWpfQy/mpnesDvl4sZGbvkwuWXtz2VkB73S9/BhmMN3MIdGA2NUlJkvs
	bx5g0ouAqeC1YlvqAXkdSzMRVgF8KHqo/YsXu5UoGtLcq+Z6L3LhcFhFcMhCWsQxPcfGUEta3Yz
	Pjn29WoAQ9tTTqjMccWvVhVsQS7rEitYoyWQmgsIrFAOcoFC8bTfDUIMUVlo6TlmA+MnuqDfXvx
	2h1EEWT+uJXJ+IiozD7a7s4D17pT2qL1gdFuSpZh8llvvhsmYzdd5oFscGizcg+FY2px25rN0t0
	aj9MFfYQKIwGBdGkdl4y0+M3kkE3+NdlxrqjjQkVeFvGwNgoCSbbMujRGRgFOg7jKrSPH1tXAzF
	TZ7OxuocTY8CFNfdZItgkv6logvFUIiuQBwH0YcBFnTcFcy7A=
X-Received: by 2002:a05:690e:130c:b0:679:c2c9:db4b with SMTP id 956f58d0204a3-67ba51296d3mr7548688d50.106.1793728927385;
        Tue, 03 Nov 2026 10:02:07 -0800 (PST)
X-Received: by 2002:a05:690e:130c:b0:679:c2c9:db4b with SMTP id 956f58d0204a3-67ba51296d3mr7548653d50.106.1793728925663;
        Tue, 03 Nov 2026 10:02:05 -0800 (PST)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67be7323348sm569794d50.2.2026.11.03.10.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:02:02 -0800 (PST)
Message-ID: <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>
Date: Tue, 3 Nov 2026 13:02:01 -0500
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Two copyright notices missing in 6.20?
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Alejandro Colomar <alx@kernel.org>, Xavier Leroy <Xavier.Leroy@inria.fr>,
 linux-man <linux-man@vger.kernel.org>, Michal Schorm <mschorm@redhat.com>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan> <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <aun6mEuYKQG-1IKv@devuan>
Content-Language: en-US
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
In-Reply-To: <aun6mEuYKQG-1IKv@devuan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 10:28 AM, Alejandro Colomar wrote:
> Hi Carlos,
> 
>> Date: 2026-11-03 09:55:31-0500
>> From: Carlos O'Donell <carlos@redhat.com>
>>
> [...]
>>> Did I miss any?
>>
>> Yes, 3, but I will also note the remaining 4 topics that came from the audit.
>>
>> (1) Copyright statements for Michael Kerrisk
>>
>> sync.2:
>> \" Copyright (c) 1992 Drew Eckhardt (drew@cs.colorado.edu), March 28, 1992
>> .\" and Copyright (c) 2011 Michael Kerrisk <mtk.manpages@gmail.com>
>>
>> select.2:
>> .\" This manpage is copyright (C) 1992 Drew Eckhardt,
>> .\"     copyright (C) 1995 Michael Shields,
>> .\"     copyright (C) 2001 Paul Sheer,
>> .\"     copyright (C) 2006, 2019 Michael Kerrisk <mtk.manpages@gmail.com>
>>
>> epoll_ctl.2:
>> .\"  Copyright (C) 2003  Davide Libenzi
>> .\"  Davide Libenzi <davidel@xmailserver.org>
>> .\" and Copyright 2009, 2014, 2016, 2018, 2019 Michael Kerrisk <tk.manpages@gmail.com>
>>
>> May you please add these 3 back for Michael?
> 
> Sure; thanks!  Will do tonight.
> 
>> (2) Removal of Linux Foundation copyright statements
>>
>> There were ~116 of Linux Foundation copyright notices present that were removed.
> 
> I'm waiting for them to approve it formally.  I expect they will.

Thank you.

If you need any help there please just ask and I'll see what I can do.

>> e.g.
>> a1eaacb1a5 man7/signal.7     (Alejandro Colomar    2022-11-09 16:36:36 +0100    1) '\" t
>> ^fea681daf man7/signal.7     (Michael Kerrisk      2004-11-03 13:51:07 +0000    2) .\" Copyright (c) 1993 by Thomas Koenig (ig25@rz.uni-karlsruhe.de)
>> f527d6fe30 man7/signal.7     (Michael Kerrisk      2020-11-12 16:36:34 +0100    3) .\" and Copyright (c) 2002, 2006, 2020 by Michael Kerrisk <mtk.manpages@gmail.com>
>> 743bc3957a man7/signal.7     (Michael Kerrisk      2008-07-04 14:36:28 +0000    4) .\" and Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
>> 743bc3957a man7/signal.7     (Michael Kerrisk      2008-07-04 14:36:28 +0000    5) .\"     <mtk.manpages@gmail.com>
>>
>> a1eaacb1a5 man7/signal.7     (Alejandro Colomar    2022-11-09 16:36:36 +0100    1) '\" t
>> 73ec1f03be man/man7/signal.7 (Alejandro Colomar    2025-11-21 01:08:05 +0100    2) .\" Copyright 1993, Thomas Koenig <ig25@rz.uni-karlsruhe.de>
>> 73ec1f03be man/man7/signal.7 (Alejandro Colomar    2025-11-21 01:08:05 +0100    3) .\" Copyright 2002-2020, Michael Kerrisk <mtk.manpages@gmail.com>
>> f99f884ddb man/man7/signal.7 (Alejandro Colomar    2025-05-17 15:18:26 +0200    4) .\" Copyright, the authors of the Linux man-pages project
>> ^fea681daf man7/signal.7     (Michael Kerrisk      2004-11-03 13:51:07 +0000    5) .\"
>>
>> Did the project get permission from the foundation for the removal?
> 
> Not yet.

Until that approval arrives would you consider reinstating the copyright notices
that belong to the Linux Foundation?

>> (3) Collapsed years
>>
>> Michael's copyright status collapsed from 2002, 2006, 20220 to 2002-2020.
>>
>> Were additional contributions made in the intervening years?
> 
> I don't know.  I suspect there are, even though he probably didn't
> consider them worthy of copyright.
> 
>> If there were no such contributions then the years should be kept distinct.
> 
> I think I disagree.  The copyright dates are only meaningful as a start
> and an end.  One could also argue that 2005 means 2005-01..2005-12, but
> there might have been contributions only in 2005-07.  Is it legally
> meaningful to say 2002, 2004 in a way that 2002-07, 2002-09, 2004-05
> isn't?  And is it legally meaningful to say 2002-2004 instead of any of
> the above?

I've responded to Branden on this topic downthread.

I leave this with you to decide.

>> Only ranges like 2002, 2003, 2004, 2005 etc. should be collapsed into a contiguous range e.g. 2002-2005.
>>
>> May you please correct the collapsed ranges?
> 
> I'd really like to avoid this.
> 
>> (4) SPDX identifiers
>>
>> With Linus' clause restored, the SPDX identifier for setreuid.2 is not correct.
>>
>> The original text read:
>> .\" Portions extracted from linux/kernel/sys.c:
>> .\"             Copyright (C) 1991, 1992  Linus Torvalds
>> .\"             May be distributed under the GNU General Public License
>>
>> Which makes this SPDX identifier incorrect:
>> .\" SPDX-License-Identifier: BSD-4-Clause-UC
>>
>> Should include GPL?
> 
> Indeed.
> 
>> Likewise bind.2.
>>
>> Likewise connect.2.
>>
>> Likewise iopl.2 implied GPL.
>>
>> Likewise subpage_prot.2 implied GPL.
>>
>> May you please update 5 pages with GPL notices?
> 
> Thanks!  I'll GPL these files tonight.

Thank you!

>>
>> Likewise signbit.3, significand.3, and memcpy.3 are GFDL derivatives.
>> - These should be rewritten from scratch or GFDL front-matter invariant requirements apply.
> 
> Ouch!  Indeed.

Yes, these are problematic and we should move towards compliance.

>>
>> The man-pages project should not copy from the glibc manual
>> due to the GFDL front-matter invariant requirements, and that
>> GFDL cannot be combined with GPL.
> 
> Agree.  I'll try to rewrite them from scratch.

Thank you!

> memcpy(3) will be easier, because I know the page very well (and I've
> already rewritten most of it from scratch; I guess the only remnants are
> in CAVEATS).  The others, I'll need to learn about them before
> rewriting.  I'll use the BSD pages to learn about these APIs.

Perfect.

I will go publicly on the record as saying I do not like the GFDL for the
glibc manual, the invariant section, and choice of incompatibility with
the LGPLv2+ means we can't even copy comments into the manual without
having someone who can relicense them. This is a process mistake that we've
been trying to fix for a long time.

>> (5) Uncertain provenance
>>
>> Restore the des_crypt.3 uncertain provenance header:
>>
>> .\" However, the above header line suggests that this file in fact is
>> .\" Copyright Sun Microsystems, Inc (and is provided for unrestricted use,
>> .\" see other Sun RPC sources).
>>
>> Or conclusively resolve the provenance issue.
>>
>> I'd leave the SPDX-header as-is because Eric's statement can be seen as authoritative
>> over the uncertain provenance.
>>
>> Likewise login.3 uncertain GFDL.
>>
>> Likewise remove.3 which should include copyright notices from unlink.2 as a derived work.
>>
>> May we please add back the uncertain text notes?
> 
> Okay.
> 
>>
>> Were any of these uncertain notices resolved?
> 
> Some of them might have been resolved due to the affected text being
> removed.  It's probably not worth the effort, so I think it might be
> easier to just restore them (even if maybe not relevant anymore).

Thank you very much for your help in getting everything to point where
we can publish this in Fedora.

-- 
Cheers,
Carlos.

