Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742042;
	b=dpjWGqOrQzM6QWQE+LOQ6qEw0aXUQLpjF8Zk0h39scgZqj9o2S6f8K2dfmC+8wmA4lWK
	 89MT5ZGGeGku2QBAUBjLRs7ztQYEOQNZquq1wzNlzMFiMHohxmul2reG/eXn1xTGS5ioC
	 SjSyT2pm8KN3h5xE8oUPN/hqmNoRGMX4JnTu1MRs8/qM8fM4Xt2d1ZQjEdRnulZiu0GMs
	 70f7ItjHP+iAaq/fccQgjiSm/b93gOu4LHrOxU9mGqxc+o6ZfIBcyQkscsgBdQi7BR46h
	 54pN0fA3q3CnmFwSa/+2rMEuXzJ0lemiudK1IOR4wzter9CJjhbe2dtFiMKYLuLfnmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742042;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BWoMjRM0odgkdAcCVdCQ2Wl5jjUkUukRu8hRqB3iIlU=;
	b=aeJhoLofzdb3zxbVSppMed/AfLlnD4Xvp/Bv4zz/gWS9GSODsttb32tdqk44BILpJquX
	 DK63p+UXgfohl0yT12PWlb+61vyjTHMJcTvG/DuChPTp2ws0T7th/MQUzEdqPjs/rCJRE
	 x7ypgQDmquFWx7sRk9QsCwW75LRrTIcyUSqW9juuUGqr78f8CW/DfrD1wm2YdRcC4CYib
	 QSGhGs2vEj9pVq79yaQRfnEJ4Hl/rSeAJZrpuZXKvHjiSCLvZzMtGpEd+Wg5TB3tVrBX3
	 GDj/uof89RJvW+ZttyHRq6KwuoI5KJefXn00NoTTX3kjwk0O/mF6IBCGn07LdvquOHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A7LsUX+l;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=N2QdRp4P;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE84606A31B
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 21:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE84606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A7LsUX+l;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=N2QdRp4P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793742041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BWoMjRM0odgkdAcCVdCQ2Wl5jjUkUukRu8hRqB3iIlU=;
	b=A7LsUX+lhzMpa5cx223QgHHl0Kh3pJ1a6QnLnapBIj+QMvchNXj4fQhPd4+5T1YmF+kTAQ
	9sPxiF/Fex1hZkNoe0JpKafEbmCtXgXvecAM3n5X0PEVnlhJbAq/ykZWzvmTmvNCPy/Cwj
	Q8OLuzjOLnaHugoKkY35vHdfNRsRpZQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-6uR_T3-POo-Dc8f1LnLtoA-1; Tue, 03 Nov 2026 16:40:40 -0500
X-MC-Unique: 6uR_T3-POo-Dc8f1LnLtoA-1
X-Mimecast-MFC-AGG-ID: 6uR_T3-POo-Dc8f1LnLtoA_1793742039
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b300e5bbacso11299427b3.0
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 13:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793742039; x=1794346839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BWoMjRM0odgkdAcCVdCQ2Wl5jjUkUukRu8hRqB3iIlU=;
        b=N2QdRp4PFsxOn0V31hWGT93eyDP3nliwoFwIrskeQjfxpDmyituf6bpiHfCwJg58+K
         upS1z1HIFzio1x8rAcNYVMprzHzMk1ULI7dzdmH4YrULE9tejnaIdrIR6wWSDpUxMf9p
         U9mDVu7abA7z1edWPS0Auk5GbD08AnWu58+EsnpW1ed6XqDutQvfTUpOaMk4GfDHM20M
         nDuB/VVNR58ubsilYGyNz4SxG1J0TLLmndGi4VliFJbf8V8GHaM7j3I0wjXcs+bEUvcg
         USNOG2Ck8DJcwy+gcT6flwOpNtFnBqsOaHKgaBUG/ToYDYU8raI52VfTcmYSCMxO7BW4
         GUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742039; x=1794346839;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BWoMjRM0odgkdAcCVdCQ2Wl5jjUkUukRu8hRqB3iIlU=;
        b=ZzuvbUdsZZa8xkpev6q2w7OPGbTzE/7rld0ZkOQ7cAV1lLz8acEyQn8MKSZdqKEXdc
         rbA1DX5kT2mb+xqkXJcnEJZHwpiVZWxZABWZWjBW3WWnKFBBnHIZtmDtwnnSK9osjaHK
         ay50EpDSm2zVVnOk4NiOsEtM1yeH6cASm8TCTa8FYSfgV1crWGO4HtObZAD0pxXIoGvY
         0Ak4V7cnunQ+aSx6nF9ltFfCPt7l6sMjDl8SQMTJ52gNyk+qQBWj39TS0vexnCId+Cwi
         HtMazzluLk3su6567QpQP/RXUvJnZ2PQm6bZFb+3CjQwZqZC39JU3dT8cYnaspdp9YjV
         m0WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgmTg6AMgo5yuyQCAEoGO6Rt5hSRR9us2Xt2LYq33FLdwFYxv3EcPxdv4iuHjGiqFpYnjpQTFHMi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+udw26o1uzLtV3rrr1FI40gSUkVMj1nKtytcc9I4P+9F+/3Wun
	LYUNEtKHYC8eEgq8REzlZcTgN+e7Gg4ecV2bttlX8xzIc8BEcQBCMEYtv4+lfYNcvn04X953Ozh
	3n9vyDX+qcmJgzMTeXo27xGT6aqxoSBYml/LWe5odtS74iJ8IjalxjaaZ3tg7Kg==
X-Gm-Gg: AYBFou3clit8bMCwDAYMaUpLPvJ2iyDG+kyi6KeSVHDDZIqSHfoo05WmOf/KYoeMwBo
	9ELj6b7RHgFvSDSsrrQ3yNnALFG4pzAkII1K/Bx4x410XXVlzAK7OUh8mwO/cQwqeTnSLq8kIey
	yQBbTXwuJFuJKRpWj/B9oK/LjPiuy8yXKAoxxICw2kHUcBCjQJx9ZyOSDLxwuXiUwXZnb42sdoT
	R8vT/I/HGimcsoEFOFBX7htOO2+05GqvHgvxlAiN+JkIHkDeIY7drBnibsZ25qthUwDWlfef8eC
	bsv5OBUbbRdiZKDKCOp2yvqQ6hCcpjdoSBJ8r9DQRSwBV6zyEdxU8ZFmldVDurWfwd1XAQPKDms
	G2kFjjYM8FL8+CvHP9uC8OV8AXR9tWm/jtCJT+kwdxB4O4E/tGNNTzoZxAnr1ueqVgZUJWqEW/k
	m6+giH8+Rm5mbQelLsTPk7PNUbYGciNvzCLsiLGvECUXruTzM=
X-Received: by 2002:a05:690c:698a:b0:8b0:a30a:7f31 with SMTP id 00721157ae682-8b2b679ba96mr91979467b3.29.1793742039327;
        Tue, 03 Nov 2026 13:40:39 -0800 (PST)
X-Received: by 2002:a05:690c:698a:b0:8b0:a30a:7f31 with SMTP id 00721157ae682-8b2b679ba96mr91979227b3.29.1793742038645;
        Tue, 03 Nov 2026 13:40:38 -0800 (PST)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3097119ddsm5796317b3.6.2026.11.03.13.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 13:40:37 -0800 (PST)
Message-ID: <4c2d83e2-72a1-4df2-9287-542010188d21@redhat.com>
Date: Tue, 3 Nov 2026 16:40:35 -0500
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
Subject: Re: copyright year ranges and "collapse"
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, Xavier Leroy <Xavier.Leroy@inria.fr>,
 linux-man <linux-man@vger.kernel.org>, Michal Schorm <mschorm@redhat.com>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan> <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <20261103165448.3y5ujyzvgypygjgj@illithid>
 <e9634fc8-26be-485d-8bf5-ed32098a8ae2@redhat.com>
 <20261103183949.2r6w43u2ok6tij76@illithid>
Content-Language: en-US
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
In-Reply-To: <20261103183949.2r6w43u2ok6tij76@illithid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 1:39 PM, G. Branden Robinson wrote:
> At 2026-11-03T12:55:53-0500, Carlos O'Donell wrote:
>> The man pages project can choose differently.
> 
> Of course!
> 
>> I agree with the guidance because it is more accurate, promotes
>> eventual entry into the public domain,
> 
> Only when there is only one year in the notice.  If there's more than
> one, how do you know which parts of a file have passed into the public
> domain?  If people can't identify these parts to reuse them freely, then
> their liberation from copyright is a mere notion, without substance.

Only if you have one source tarball?

We often have more than one source tarball as a durable artifact of the
release process in downstream or upstream, and with that you can "promote"
entry into the public domain.

> I don't think you read my message closely.

Maybe. What do you think I have missed? 
>> and can be referenced without access to source control.
> 
> ...without that?

May you please expand on that question?

>> My understanding is that under US Copyright the years may be collapsed
>> without invalidating the statutory copyright statement.
> 
> As far as I know that's correct, but I'm not a lawyer.  I offer my views
> as one project maintainer to another.

Likewise.

>> I leave this up to Alejandro to decide.
> 
> I don't think he requires your leave.  ...unless you have executive
> responsibility for copyrighted materials in it that you mean to withdraw
> if Alex doesn't administer the Linux man-pages to your satisfaction.
> 
> Is that the case?

LOL. No.

Let me state my goals.

Firstly I assume we're looking to achieve consensus in this discussion.

In seeking to achieve consensus I *don't* want my objection or disagreement
to be considered blocking in any way, so when I wrote the above I intended
it only in the sense that I don't want to block consensus from forming.

If you and Alejandro form consensus that the project won't keep years
separated, I'm fine with that.

I could have written "Please don't consider my disagreement to block anyone
arriving at consensus on the matter of expanded or contracted copyright
year."

Instead I wrote the above terse reply, deferring consensus because Alejandro
as the one with commit access has ultimate governance over the project.

Alejandro doesn't require my leave.

Secondly, I want to ship an updated man-pages in Fedora, and I would like
to work through the outstanding license and copyright issues to support
that. Alejandro has asked what is missing, and I'm providing feedback.
If there is something where we don't agree I assume we'll work to seek
consensus (like this topic).

> Regards,
> Branden
> 
> [0]  In fact we have nothing at all prior to groff 1.01 in 1991, and
>       that only because BSD Net/2 got preserved on the Web.
> 
>       https://www.tuhs.org/cgi-bin/utree.pl?file=Net2/usr/src/usr.bin/groff/groff/groff.cc
> 
>       So anyone agitating for groff pre-1.01's public domain materials in
>       2084-2085[2] will, I expect, face a daunting task in software
>       archeology, if some wonderful discovery is not made in the interim.
> 
> [1]  https://www.gnu.org/prep/maintain/maintain.html#Copyright-Papers
> 
> [2]  As I understand it, material copyrighted by the FSF in 1991 will
>       pass into the public domain on 1 January 2086.
> 
>       https://www.copyright.gov/help/faq/faq-duration.html
> 
>       But maybe I'm off by one and it'll be 1 January 2087.


-- 
Cheers,
Carlos.

