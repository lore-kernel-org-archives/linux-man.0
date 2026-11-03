Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717739;
	b=3E6Xdlk9RxECLhh5ZorikmZ6wXTmsGwlxCvra2M5RtGJGEra4IlTIGRQoe4SVKy3YEDm
	 aaWtzmKu4+9BioCuH/oWkLoEN2XTnKze4h0aQjhC+EbZPBhxRLHKjbEkO7iOHqT06ZR2V
	 I2C1lEptJ/8FZz7ZRo/u8lm0jlfDMwJDajDqaZ3/7fCAQLUknL4vm96bZTcn3xm/BtkW1
	 Y+81jloWwVn5NNC7Gafre3rxYKbBpHsJ0fRLVXeKBHXFeHs6uM+x20+UFIDAimvKkhJIh
	 tIkH3BjnVHMfkflLHKpgxuOEL8Iq4rvhufnv3jJDF5PLAAqOgPO6YKbAWt+1uwXrN7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717739;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dfSV//eJR+rbqVndGxJ4ZjoZUgovxAv97bMYYu+SRog=;
	b=M4maBwYc2KuWEY7wj2f6ZRfIW9WIXSrTOKGxNIn3P+PU+Mg/+7lKhqju0LgboqoyeOdD
	 sc/NXpLqjjnp0i422tDw8dYOhz8OIK8SI5BLGA/Ns2LG8mPjH4+/2oXI4zzcNWAg6PE4e
	 wk0mT244tA5Xmx5Bf3nLukY66NQRePWLSXEKTBplG5yz2qmLSb1dHZpu6jPh81UL/V4+U
	 0lZU5khTehZRQFAdH/G/mo9y88Fvt5J0kwkpHMBNR416oW9TCymhc5LgxWAaDIxMd3Wq5
	 VXxeoLb3DWkrdtBLEUTH9b0/N5Rl284yCWTnx+rFJmSz0HQtPtS4uq1eUHgi6ANh71w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5Hiud2N;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=efLURj8m;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0DC606D807
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 14:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0DC606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5Hiud2N;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=efLURj8m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793717738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dfSV//eJR+rbqVndGxJ4ZjoZUgovxAv97bMYYu+SRog=;
	b=e5Hiud2NrSf5ILde10WMuu3G5yRdwXkA/lBTB50CZCwagUFwYrU66LTKApi+OHvH/72r+Q
	cNl5VJmlj5JtShUuPtxJUJ1QDS3oMobomIXeBvpwuroZzSKff2jzXtLoovxzDwo/OOjkP+
	XxjTbb2CGFxigpoyZqsjHKYH4VdGo/k=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-dGJ6qxFMNxCS8-C0__EJ0g-1; Tue, 03 Nov 2026 09:55:34 -0500
X-MC-Unique: dGJ6qxFMNxCS8-C0__EJ0g-1
X-Mimecast-MFC-AGG-ID: dGJ6qxFMNxCS8-C0__EJ0g_1793717734
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0da010661so63993127b3.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793717734; x=1794322534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dfSV//eJR+rbqVndGxJ4ZjoZUgovxAv97bMYYu+SRog=;
        b=efLURj8m6tcxxTkcRQk5Z/eGr+q9Cbgs0rrPw2rTj8r4niultpjKCk/JcvuQlxjcjb
         iZTmCLuGtUgr/lQozMCso4wj7IgCuYLyRaY4eW+2TSv9/GEXvxlvlI0FSfYi9Iy2dNDl
         lr+nxHQjMvjVGJ79ILGXAT/m7zWEjZn0uTjsP4feIHBuHE/EePuHQKlMaNowAwyUuNsV
         bXkRSOMCgAliuH9sa/yiCsyqFed0ZB1K1ECHqXA972TcL+PcBpD5qt7+TUbDHpVcXIyr
         lu6G/2MCJZ7cXdWZTaml3W7rHy3joW7gW4jAkSb9f0kh9DQtYeF2s0RdZooFK6+R0JOt
         gmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717734; x=1794322534;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dfSV//eJR+rbqVndGxJ4ZjoZUgovxAv97bMYYu+SRog=;
        b=lzxOnVCePoP3Ymg69IztwFfon3ETFmTvCpmjKP9LC632QUTKEchuh5S1vnhQ7Q7Sxb
         z+JkjixDfpbByL1g6dioKQxGBoBhWqgZme7QaaoDSPNyBKSZo189WGw7XUrEZ99wyCXH
         hPL2Gm0D613WzL8L0ya+X/hRAzuAjKz9TNDZw8tFy6JL/ECH0oXqWYyGXQDYIrJqO8/w
         BqrKNLeSRcuJF2xqS0q5c5kX1JNRHX7EFWY7YPcrtUodToQiQeHu8yRgEJU4gJvhDVfr
         WyZwc2RYMRi0N3WAMJpjPxM5dGkFIeCs+6YYLQjfez4uxJNyh2XC5BQbZv0FeFFbw2Oh
         0N3w==
X-Gm-Message-State: APuU4Z8xc3Uj1dfTJ/VtgGKBxhpUxyR865Q1Fq2j7MEjh2W/21FZ+mgt
	Pb4SRwbRvDWyu/eL0c6pV9SmAYe/86t28e2ieM7qvf6RjbpOlPTukvB4g7QaHl5Ba5vR27psG0x
	DioyAGbxZL0o3o1WSY20FVYe5CFrFsgazg0wsnwv1+HFyc+vyIK3HaHDdqr5fJA==
X-Gm-Gg: AYBFou28Xye6PPsqlwh274VDI1h2hzm084mCEbRgQYzqL713ZVvU5VppSar5R+C28yB
	JKdzw8r0hTFguFIyk9NVsCwptS1W4YF/0F050CJLcSwmQYQ46oE7nn/SBhMHaQ1DFxVdZKHqW5q
	eRgs2sjZWf0l78CgFjgKCnFxs1m3XmFYm+zOBnUGc9t4A5Qa+Lu4EBUzPovEQSnxY+8dioL93jz
	RnVmbWTpB8/ufowy/YPsMvl1l/9pW+gyzH7uNBnX963LwI3xd/reErmxEmWe6z2SmMPudHyMAFf
	hxilFZbzxuYyaNin2RXNKJyiS6JyErfHxeHQ4AUa9K4Osa3QsMEiwDOSkb3JCVbPFi/DintMWT+
	vjM6qviYFXqB2qN4VKwS8nIrv9D2/tJhGXVzLK4Jc9whFHtXNgoOY00zPV/YPC513ou9Pb27Kqd
	bUGu5i1sWbVZy1AS6OGCC5kPhmSnJA7aPhNjM3phR2TMJUcvs=
X-Received: by 2002:a05:690c:d83:b0:8b2:fde5:d95e with SMTP id 00721157ae682-8b2fde5e72dmr11436547b3.63.1793717733907;
        Tue, 03 Nov 2026 06:55:33 -0800 (PST)
X-Received: by 2002:a05:690c:d83:b0:8b2:fde5:d95e with SMTP id 00721157ae682-8b2fde5e72dmr11436417b3.63.1793717733320;
        Tue, 03 Nov 2026 06:55:33 -0800 (PST)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716433bsm74914697b3.26.2026.11.03.06.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:55:32 -0800 (PST)
Message-ID: <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
Date: Tue, 3 Nov 2026 09:55:31 -0500
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
To: Alejandro Colomar <alx@kernel.org>, Xavier Leroy <Xavier.Leroy@inria.fr>
Cc: linux-man <linux-man@vger.kernel.org>, Michal Schorm <mschorm@redhat.com>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
Content-Language: en-US
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
In-Reply-To: <aukT75oZFuvhwiEd@devuan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/2/26 6:13 PM, Alejandro Colomar wrote:
> Hi Carlos, Xavier,
> 
>> Date: 2026-11-02 11:24:25-0500
>> From: Carlos O'Donell <carlos@redhat.com>
>>
>> Alejandro,
>>
>> I did a quick audit through 6.20 since we're looking to ship an update in Fedora.
>>
>> - Xavier Leroy — pthread_once.3
> 
> Xavier asked me to remove his name from the pages when I told him about
> picking the old pthread_*() pages from glibc and Debian.
> 
> 	commit 13151ec525a21101dabb2528784bf9a86b1280f4
> 	Author: Alejandro Colomar <alx@kernel.org>
> 	Date:   2023-10-03 16:57:29 +0200
> 
> 	    pthread_*.3: Remove AUTHOR section; add copyright; adapt TH
> 	
> 	    Xavier asked that his name be removed from the AUTHOR section, and since
> 	    we don't use that section in this project, we can just wipe it.
> 	
> 	    Add copyright notices to the pages, with Xavier as the original author,
> 	    and me, who will maintain them from now on.  Xavier ACKed the
> 	    Linux-man-pages-copyleft license.
> 	
> 	    Adapt the TH line:
> 	
> 	    -  Specify the date as (date).
> 	    -  Specify the project name in the 4th arg.
> 	    -  The first arg, the page name, must be the same as the file name.
> 	
> 	    Suggested-by: Xavier Leroy <Xavier.Leroy@inria.fr>
> 	    Signed-off-by: Alejandro Colomar <alx@kernel.org>
> 
> Here's a quote from an email from Xavier:
> 
> | Date: Sun, 21 May 2023 11:40:12 +0200
> | From: Xavier Leroy <Xavier.Leroy@inria.fr>
> | Message-ID: <CAH=h3gFakgz3xcH63h-5nO0L9LuSy2Xr5b2riwpJ1o4L3DzuRg@mail.gmail.com>
> |
> | To answer your question:
> | - I don't think it's a good idea to take these man pages "as is" and drop
> | them in the man-pages project, because they are probably obsolete and
> | incomplete.
> | - However, if you or others would like to use these man pages as a starting
> | point for a comprehensive, up-to-date and maintained documentation for
> | POSIX Threads functions in Linux, you're most welcome.
> | - In both cases, I'd like my name and e-mail address to be removed from the
> | man pages, as I no longer support them.
> 
> And a follop-up email:
> 
> | Date: Sun, 21 May 2023 19:29:19 +0200
> | From: Xavier Leroy <Xavier.Leroy@inria.fr>
> | Message-ID: <CAH=h3gF3F-tOq6-zYKf63_JhR3tRZ9NFMiTpX2YEjhhjDGr7Hw@mail.gmail.com>
> |
> | I'm happy with the man-pages-copyleft  license.  If you need me to write a
> | more formal message for the licensing of these pages, let me know.
> |
> | No other requests than 1- removing my name, and 2- updating the pages as
> | much as you and others can.
> 
> I'm not sure why I kept his name in the copyright notices back then.
> I thought I had asked him about it, but I can't find that discussion.

Yeah, neither could I, thanks for including Xavier.

> 
> Anyway, I've CCed Xavier now.  Xavier, are you okay with your copyright
> notices being transformed to a generic one that says this?:
> 
> 	Copyright, the authors of the Linux man-pages project
> 
>> - Linus Torvalds — setreuid.2
> 
> Seems a mistake.  Fixed now.  Thanks!

Perfect. Thank you!

>> At the top level the following people have had their notices removed but I didn't
>> see them acknowledge that removal on the mailing list, or in your final audit here:
>> https://lore.kernel.org/linux-man/unavr5u2uynqfvj7iymgvsptq4k5s5b4ex7havl36zro4bbua4@fqpjhnsuu5ln/
>>
>> Should we add these back?
>>
>> I can only assume the Michael Kerrisk consented,
> 
> He didn't.  We talked in person, and he asked his notices to be
> restored, which I believe I did.
> 
> 	$ grep -rn Copyright.*Kerrisk | wc -l
> 	1224
> 
> Did I miss any?

Yes, 3, but I will also note the remaining 4 topics that came from the audit.

(1) Copyright statements for Michael Kerrisk

sync.2:
\" Copyright (c) 1992 Drew Eckhardt (drew@cs.colorado.edu), March 28, 1992
.\" and Copyright (c) 2011 Michael Kerrisk <mtk.manpages@gmail.com>

select.2:
.\" This manpage is copyright (C) 1992 Drew Eckhardt,
.\"     copyright (C) 1995 Michael Shields,
.\"     copyright (C) 2001 Paul Sheer,
.\"     copyright (C) 2006, 2019 Michael Kerrisk <mtk.manpages@gmail.com>

epoll_ctl.2:
.\"  Copyright (C) 2003  Davide Libenzi
.\"  Davide Libenzi <davidel@xmailserver.org>
.\" and Copyright 2009, 2014, 2016, 2018, 2019 Michael Kerrisk <tk.manpages@gmail.com>

May you please add these 3 back for Michael?

(2) Removal of Linux Foundation copyright statements

There were ~116 of Linux Foundation copyright notices present that were removed.

e.g.
a1eaacb1a5 man7/signal.7     (Alejandro Colomar    2022-11-09 16:36:36 +0100    1) '\" t
^fea681daf man7/signal.7     (Michael Kerrisk      2004-11-03 13:51:07 +0000    2) .\" Copyright (c) 1993 by Thomas Koenig (ig25@rz.uni-karlsruhe.de)
f527d6fe30 man7/signal.7     (Michael Kerrisk      2020-11-12 16:36:34 +0100    3) .\" and Copyright (c) 2002, 2006, 2020 by Michael Kerrisk <mtk.manpages@gmail.com>
743bc3957a man7/signal.7     (Michael Kerrisk      2008-07-04 14:36:28 +0000    4) .\" and Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
743bc3957a man7/signal.7     (Michael Kerrisk      2008-07-04 14:36:28 +0000    5) .\"     <mtk.manpages@gmail.com>

a1eaacb1a5 man7/signal.7     (Alejandro Colomar    2022-11-09 16:36:36 +0100    1) '\" t
73ec1f03be man/man7/signal.7 (Alejandro Colomar    2025-11-21 01:08:05 +0100    2) .\" Copyright 1993, Thomas Koenig <ig25@rz.uni-karlsruhe.de>
73ec1f03be man/man7/signal.7 (Alejandro Colomar    2025-11-21 01:08:05 +0100    3) .\" Copyright 2002-2020, Michael Kerrisk <mtk.manpages@gmail.com>
f99f884ddb man/man7/signal.7 (Alejandro Colomar    2025-05-17 15:18:26 +0200    4) .\" Copyright, the authors of the Linux man-pages project
^fea681daf man7/signal.7     (Michael Kerrisk      2004-11-03 13:51:07 +0000    5) .\"

Did the project get permission from the foundation for the removal?

(3) Collapsed years

Michael's copyright status collapsed from 2002, 2006, 20220 to 2002-2020.

Were additional contributions made in the intervening years?

If there were no such contributions then the years should be kept distinct.

Only ranges like 2002, 2003, 2004, 2005 etc. should be collapsed into a contiguous range e.g. 2002-2005.

May you please correct the collapsed ranges?

(4) SPDX identifiers

With Linus' clause restored, the SPDX identifier for setreuid.2 is not correct.

The original text read:
.\" Portions extracted from linux/kernel/sys.c:
.\"             Copyright (C) 1991, 1992  Linus Torvalds
.\"             May be distributed under the GNU General Public License

Which makes this SPDX identifier incorrect:
.\" SPDX-License-Identifier: BSD-4-Clause-UC

Should include GPL?

Likewise bind.2.

Likewise connect.2.

Likewise iopl.2 implied GPL.

Likewise subpage_prot.2 implied GPL.

Likewise signbit.3, significand.3, and memcpy.3 are GFDL derivatives.
- These should be rewritten from scratch or GFDL front-matter invariant requirements apply.

May you please update 5 pages with GPL notices?

The man-pages project should not copy from the glibc manual
due to the GFDL front-matter invariant requirements, and that
GFDL cannot be combined with GPL.

(5) Uncertain provenance

Restore the des_crypt.3 uncertain provenance header:

.\" However, the above header line suggests that this file in fact is
.\" Copyright Sun Microsystems, Inc (and is provided for unrestricted use,
.\" see other Sun RPC sources).

Or conclusively resolve the provenance issue.

I'd leave the SPDX-header as-is because Eric's statement can be seen as authoritative
over the uncertain provenance.

Likewise login.3 uncertain GFDL.

Likewise remove.3 which should include copyright notices from unlink.2 as a derived work.

May we please add back the uncertain text notes?

Were any of these uncertain notices resolved?

-- 
Cheers,
Carlos.

