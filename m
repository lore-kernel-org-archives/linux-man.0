Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794963378;
	b=DbpjIa+7g/rIXFeIXFXm16y1B4pGjFIzKD6eI9ddi7ydGW8xN/rPbqmvWsgF+EwDzVkU
	 84jqxw4ZWVZtjxHMEMgICdI6PlUUAr/7RpuCf3nPFdr/JG3BPCbik2y7UeyTdlqkfb5EJ
	 EpqkpVbT01TNIz9Gx/VDFWXMVhvnIcCd3Plcw5W4x9v+LiYWRgtFbeaFZfXhOwu+JkXtx
	 sUxNAmygq0cQGbi5vY2nK/6PcGuBD50WGOKNWrMWf67TnoXIGEWK2K6ukBhgrHjirnnR4
	 u0R4r4+9SNWzZYxHqSrhHl5kHsMm/YJUtD/jy925lsMwBbFwejWIjlOUQvSuQDs6H/w==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963378;
	h=Received:Resent-From:Resent-Date:Resent-Message-ID:Resent-To:
	 Received:X-Envelope-To:Received:X-Mizu-Trace-ID:X-Migadu-Queue-Id:
	 X-Migadu-Spam-Score:X-Migadu-Flow:X-Migadu-Scanner:X-Spam-Score:
	 X-Migadu-Country:Received:Received:Received:DMARC-Filter:
	 DKIM-Signature:Received:X-MC-Unique:X-Mimecast-MFC-AGG-ID:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Autocrypt:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Language:Content-Type:Content-Transfer-Encoding:X-TUID;
	bh=dbaqfLDrWqjxVkUQ+lB+l5siQw5il/jykgHuiCjUy7I=;
	b=gcG1sgDZNQgkFsPlKSBE8bOg1iKVlami3rFf76/1jai+raS83hlCLvslS6m+dS1CJYS5
	 z+cYK5FwJW295+u4MpJGSi2MBQc3nXjLrZdwp5OZC26ht22JJiWqaSw+qxi+GOK887iTV
	 3+b2vwdZXgjfkSsap/YxibrZ6ZS5m3T0yOhtQlMNONSRanKwqumijkDvBWlPj9hpxUMcT
	 XK8ZHCvde/tWhf0iPZJhzY6QYIAbJuiIWKS0IvVax6BMm95Od39TyZXo8cK6+tpIfgb3J
	 iec3ktBknK5TWfaHTZF976S/8XW7szsPafwngtgLSRFDaosKZU6rRFUG5YyMQwKNbLw==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=fail reason="signature verification failed" header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SzGQAWWL;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D942606A31C
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 00:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SzGQAWWL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599E51F000C4
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 00:56:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SzGQAWWL
Resent-From: Alejandro Colomar <alx+linux-man@kernel.org>
Resent-Date: Wed, 18 Nov 2026 01:56:15 +0100
Resent-Message-ID: <avz3r2wdL14Hwwk_@devuan>
Resent-To: linux-man@vger.kernel.org
Received: from mizu1.migadu.com ([135.125.171.180])
	by soraStorage0.migadu.com with LMTP id nl6o3m2uetacee5thvkq
	for <foss@alejandro-colomar.es>; Wed, 18 Nov 2026 00:13:39 +0000
X-Envelope-To: foss+linux-man@alejandro-colomar.es
Received: from sea.source.kernel.org (2600:3c0a:e001:78e:0:1991:8:25)
	by mizu2.migadu.com with ESMTPS id ae9b5879ef61bc2b;
	Wed, 18 Nov 2026 00:13:39 +0000
X-Mizu-Trace-ID: ae9b5879ef61bc2b
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
	d=alejandro-colomar.es; s=key1; t=1794960819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature:autocrypt:autocrypt;
	bh=dbaqfLDrWqjxVkUQ+lB+l5siQw5il/jykgHuiCjUy7I=;
	b=mxqjH4su6s5MjWWgHijwyHC9YhLONpscoa5QUKee9PRm0YZRe7i1+Sqk7PHUUpTIN8J8eV
	+j3RTe+zxxjXGykDp/2QSfEVl+4We/SITGRg7s4XndTBQA9ZQ/itaWVwGu3g1GMHjUqGC2
	YtyZj+Qr8abR6giqeKxv3xc3Hb7DLw55+CXFQ/YwRS3FOJT7sRQDHrGBz81ZqQZVvWfJQC
	ujS/YZ4E5WaVlZ7Rf+voTNVV8Pp61KTYS/Kedrj1sP7E2rqBDJB/O0oLxoIIUT71WWVFfe
	/VhHwLZeAo8ONF0ttRKvfY8/sgLEgV87Rov7QxWVTLszWBX4DFtFCWquvCOQcA==
X-Migadu-Queue-Id: ae9b5879ef61bc2b
X-Migadu-Spam-Score: -6.11
X-Migadu-Flow: FLOW_IN
ARC-Seal: i=2; s=key1; d=alejandro-colomar.es; t=1794960819; a=rsa-sha256;
	cv=pass;
	b=GnkbkRmygjOV+NaWpou4SRZw7GNxF19zldA64MyFLAT8gGPLCWxtQHrgECB7xJ1yo/5Ylm
	qBR649Rvhu/SPNADsLVAQ80mFM/dCRrA2H2yjdohf8RWZLudXr9IPKZLvOgfK7i1R8uMZP
	KrMZhyFkQkvsFjS8uYNJk0dEcCvZo4J9IGUd4Y/Zjv9gfkecPIQG3eJej5FfZrYKVJW5If
	bO0Dornbet2Ew3L2O6UJTVnzWjGyN3IdzbgWWrV7tFcDE88jyHLaTHuJLHMrKgKaen+5Eu
	jAezrAeoQ4y2i2Dua8bArRc8xp25kdPSaJmfiRp4GU1TrTWd44xNhK6fPIvMAQ==
X-Migadu-Scanner: mx13.migadu.com
X-Spam-Score: -6.11
Authentication-Results: mx13.migadu.com;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=SzGQAWWL;
	arc=pass ("kernel.org:s=arc20260519:i=1");
	spf=pass (mx13.migadu.com: domain of "SRS0=lrOX=JH=redhat.com=codonell@kernel.org" designates 2600:3c0a:e001:78e:0:1991:8:25 as permitted sender) smtp.mailfrom="SRS0=lrOX=JH=redhat.com=codonell@kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com
ARC-Authentication-Results: i=2;
	mx13.migadu.com;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=SzGQAWWL;
	arc=pass ("kernel.org:s=arc20260519:i=1");
	spf=pass (mx13.migadu.com: domain of "SRS0=lrOX=JH=redhat.com=codonell@kernel.org" designates 2600:3c0a:e001:78e:0:1991:8:25 as permitted sender) smtp.mailfrom="SRS0=lrOX=JH=redhat.com=codonell@kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com
X-Migadu-Country: SG
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B60540DAE
	for <foss+linux-man@alejandro-colomar.es>; Wed, 18 Nov 2026 00:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21A6C1F000C5; Wed, 18 Nov 2026 00:13:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794960817;
	b=zZyH7kVaDCOKwHx3HdxW/gwUzZijWVPRy6Vfi1IDu38Y9lx1Rg8dIbKNyLtFVhxDTT3I
	 fbgHBHkhy6kq3J2Y6xpA3m1VS45lo0rnPL9UJM5XngLsVjkYoy+pEpS/CxI8do+e1AMOf
	 fmf7nT9yY2xBGNsGVtCUCPM5Zyi1rA8xyz/P5OJ3l4Bt83GF9Ih5tyBKpEdG5dj1ghPwx
	 hb+l/HPu5iMPno30OKVLu1nDHm/fXPxPIsMCvVm4WBdU8ubMkL2c6LyUaFLtPS8im/qs3
	 p7yhOO6b5X9Yq8+Yaoal2sMPt5DxhzLo31qPfKCDI4DU/1fn2Z2bcLufrVPNXsbG67g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794960817;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:Autocrypt:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=dbaqfLDrWqjxVkUQ+lB+l5siQw5il/jykgHuiCjUy7I=;
	b=rSoTAWgzjbXSzQTcjxmerQUPJ47keinmJWuKEtwUQGd6lQbewHhaQAPO8V2JQ/Zw2qs3
	 vV87f9ntTPwcC4HUKvkDCECu+LPNIzrhp2S6iYR7rFOncKMoUUL0yKNBdKpwyp3Xr7upn
	 eDcV1gwoITwKFGQjXX5hUnL1GbwdMV6dZe7ifydc1uxYZDqWc1VnYcBeI3HY+wZ15/tXP
	 xSzoH8fFSN1ZczY6XHxjA2jrkesPchTGPeaKrQeSZnSq3nMDvXXqR57V2WKJWmAlL7PpA
	 q/ov7cA4I3kp8zF04jc0Cq3LGJkPYji1d1Howv4Ip+Wvfhjj693k3sMZKFY/mD1FBPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SzGQAWWL;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.129.124
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1687C1F000C4
	for <alx+linux-man@kernel.org>; Wed, 18 Nov 2026 00:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1687C1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794960815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dbaqfLDrWqjxVkUQ+lB+l5siQw5il/jykgHuiCjUy7I=;
	b=SzGQAWWLFb70wDxT6OCMb1zIv50bjyHeoylgPKTWT0KWHcegjp6MRgy2Jo7qSMNf5xcD1D
	CSDt24Dw6VHm73Lbn0TPr92T6wBSGK4Mh4zmOlVQ7lr73qRKzNquvZWj9DAwEfm3vMRVdD
	y0pwPErlbca6VLnzU0SO05CVl3guZjE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-u0n0IqMKO8u38XeQNtJzKQ-1; Tue, 17 Nov 2026 19:13:33 -0500
X-MC-Unique: u0n0IqMKO8u38XeQNtJzKQ-1
X-Mimecast-MFC-AGG-ID: u0n0IqMKO8u38XeQNtJzKQ_1794960813
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495af07676so79177185a.2
        for <alx+linux-man@kernel.org>; Tue, 17 Nov 2026 16:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960813; x=1795565613;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbaqfLDrWqjxVkUQ+lB+l5siQw5il/jykgHuiCjUy7I=;
        b=JoErgVFlpnMglbNKie0vkWUU91428/hjPqlPAIZphzYDaYac6N+SluxOr9CvQBqUTY
         YOalMKpzo5eynGyZC5kKotghtkngm1JglsPgoZi93B4RnOsokqYGp6RUs58W/oC0fZGI
         shBioOiduvlSlLaq7RrESZtaRWEUeAayjxBeuZ1rFWXfp2xDWtKtmgN511d9AEXYonkU
         gigYHMZ6Qu4ZwE0NRcAmFJpuMaI2DjyMxWw2RdT1R18TCKQEnhY1fUC0ldVJahzmWB30
         1cj/UTAI3ijlfff+nMijA0zs/NQtdHv45xVLl/ad0sC4WHu032wRf5kWBdOazk6sgM25
         QSWQ==
X-Forwarded-Encrypted: i=1; AL+hErHBMEiGfnlni1pFd9d93nT+mQxEK7wSCAHimTBsPdEPrSw9JUdmpIn6l1FEiQVK2hVBo90=@kernel.org
X-Gm-Message-State: APuU4Z+VOpuT+8Mu5byq8j7+eMcSYE/z94HVd1QtwjziqE2ilYTB3DRU
	N7PmEy0Iii3NhDZDQbLNItu0e2BwOZ2EBBNDnmn32uTO+dFnRk9ROFZup+uVgpaERKyI6Li9FBQ
	oe78bI0luH/FR2GK/ghdN6k+TcSmLFYArytT+KL/3jHuiIBeWc682EdpJVHTg
X-Gm-Gg: AYBFou0h3UAS3gAiy5Miu0meokCqy9xQyXcvwlJBJWHytUL032SGRX5+yV8ELegYPX1
	qNGBa4LF4G30US+JGEHlzYBOAx2gBALjbj4dcihh743BYIC01evRakjjIfj+lRGNY5C/ZdM3C+9
	NmbuTpOS6R5sYdFcQKczPgjJkVzDN5xvxXhcGLR3JrbjwGPFhYx/ulUGus5HhYhgQaqltsE1/ws
	2ZkUt4PMRBX+x4Weda1zpFTsPnWSPG7F7k0+GkC+3oBhYFpPL5+U81pBQXlEwqOv1EoGWd92q6M
	potqWT0MGaAgoT0aSY9brz0Xe2PZSfAGSBsN4uHdO612RmCrtRdBFzsmjIlmzJSTJ0tl4ovDE3u
	9GkZPXW7KFROyr+aqFBl300FyGd0xUBeOE+uC4msUJ5ybOQCbxenPr2dCV/MFwO4+jhLiJujvWO
	b7UKcBANpeg9EvYcM1vDx1n8oPkRaA+Xl1djLg324O5Gpa3ma4A8A=
X-Received: by 2002:a05:620a:700d:b0:945:f6b0:db0 with SMTP id af79cd13be357-9499970fadbmr215889485a.30.1794960812899;
        Tue, 17 Nov 2026 16:13:32 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:945:f6b0:db0 with SMTP id af79cd13be357-9499970fadbmr215887085a.30.1794960812492;
        Tue, 17 Nov 2026 16:13:32 -0800 (PST)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b2892a2sm53655885a.0.2026.11.17.16.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 16:13:31 -0800 (PST)
Message-ID: <1458827a-f1eb-41cb-8b42-d4a088fcb550@redhat.com>
Date: Tue, 17 Nov 2026 19:13:30 -0500
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
Subject: Re: [PATCH] man/man7/credentials.7: Mention potential SELinux impact
 on credentials
To: Patsy Griffin <patsy@redhat.com>, alx+linux-man@kernel.org
Cc: linux-man@vger.kernel.org, fweimer@redhat.com,
 Carlos O'Donell <carlos@redhat.com>
References: <20261117161046.2037417-1-patsy@redhat.com>
From: Carlos O'Donell <codonell@redhat.com>
Autocrypt: addr=codonell@redhat.com; keydata=
 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
 eIqGx8dNOLsl
In-Reply-To: <20261117161046.2037417-1-patsy@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GN5RIZDYlNKoCS3lpTyAeM1kx-C7O_Ca6uTCtMt06IY_1794960813
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NLDTmFKRUoVi

On 11/17/26 11:10 AM, Patsy Griffin wrote:
> An SELinux context may impact traditional credential access control.
> 
> Link: <https://bugzilla.redhat.com/show_bug.cgi?id=884625>
> Cc: Florian Weimer <fweimer@redhat.com>
> Cc: Carlos O'Donell <carlos@redhat.com>
> Signed-off-by: Patsy Griffin <patsy@redhat.com>

LGTM.

Reviewed-by: Carlos O'Donell <carlos@redhat.com>

> ---
>   man/man7/credentials.7 | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/man/man7/credentials.7 b/man/man7/credentials.7
> index b538b1702..21e42ec30 100644
> --- a/man/man7/credentials.7
> +++ b/man/man7/credentials.7
> @@ -335,6 +335,12 @@ is carried through to all of the POSIX threads in a process.
>   See
>   .BR nptl (7)
>   for further details.
> +.P
> +Credentials may also be impacted by Security-Enhanced Linux (SELinux),

OK. Semantic newlines.

> +if enabled.
> +See
> +.BR selinux (8)
> +for further details.

OK. Yes, they can have an impact, and selinux.8 is a starting point.

>   .SH SEE ALSO
>   .BR bash (1),
>   .BR csh (1),
> @@ -386,4 +392,5 @@ for further details.
>   .BR system_data_types (7),
>   .BR unix (7),
>   .BR user_namespaces (7),
> +.BR selinux (8),

OK. Correctly sorted after 7 and then alpha.

>   .BR sudo (8)

