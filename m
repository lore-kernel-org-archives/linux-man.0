Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6186F4A35
	for <linux-man@vger.kernel.org>; Sat,  3 Oct 2026 20:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060504; cv=none; b=dcGge9w0hGgCvdv8PrLBbsrN2rDVZGi810E9rDTj7V5fw3UQA/QGSa81Um/qeY4Cqpt0MieXBlKCHIR9pU+qs/G7YUqfoNFxwEh/BTbZ1cKWLwlASnYQ0xDvH/nTTQTrxmh5mOYPgkMI5klLUhfVXjAZWNnxQOgKbTXFSqVCWvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060504; c=relaxed/simple;
	bh=dYORu69rzod+Oz7VAto7zGr2SxRSE/XXrsF9JFg+6bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yl/eT5HQLwXX6UzF8PW16O6ysXliLzhZBvTaa2Q2pb0DMBCO6oG1cCnsTuVVFQ2HsSZmIjZ8lG3+CCfJMGIerv19hMm1/2V4NcH0Ig3SM1y94284t4Yr/9AizYrB6ncFp6z9Nk5EbTigo4CQr1TWD7W4uYJerZpXT+DLDwAVWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RX6Flx3K; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RX6Flx3K"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so7238065e9.1
        for <linux-man@vger.kernel.org>; Sat, 03 Oct 2026 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791060502; x=1791665302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbvz2kP5ROkukItBOwlv17sEVJe0tQD5wVACLjqoeBk=;
        b=RX6Flx3KEYdH+9Iygg5gfhLpbDrurT4M3m+Wh8yKEjf9aUFk1DquWCCUtM2N1qyo1j
         kPWraugX+IFDWQKwGpjcI56XTO2PCrFX8ZGkcslHpy18VvL5D33rSLpAd6NA4Vnn8eYY
         PwyVJ3f//wFMi6/DCH2M9aT76VOmOAv/3jrsDmxH5cZnIV3sfGZq8NRZaATNkAOrNfrA
         HdR2JBdpgUQn672N08vq9SuVXSnis0mNcuYvyc+VpC2aapRTl/g8WvUq2FFS77U5Q7V6
         F1foaOXRtROzkDL8VYOFsFjgexk4LTccVSva/BXZXGJEALjegMpGRBvMiO0JrB5USP4+
         yMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791060502; x=1791665302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbvz2kP5ROkukItBOwlv17sEVJe0tQD5wVACLjqoeBk=;
        b=ddg5Er1YNS/iO30BcxADyvJrQTe2VZOkfn/pHg4WQxkwDUlVplSsHATddGKDtoyJVE
         HF3ngGBi00ETjEEuUwKwOTyAFVypQUwWrcNatEaCBsVTyi609mawryjquANq3MjPNlAL
         rqYzYb5euCzzu/PnMgXgGSPEUwCIOVA4WYs8WqofRCH7KFTcXYgB6JIV59q1KoET5s3F
         7jnlwM1o6iNyr4zcBOt5IRRX3DDx+6L8Bm96AhZzvfNPdZ3hzdEMD6b6hnTfOWoU7Z3n
         1AhDh7/axsikUDKF2gLpmJMDQmNoNp73OphBEuH7lg7aQGJBeIEd5If5VV1b6fMiczM4
         saPA==
X-Forwarded-Encrypted: i=1; AKwUvBy30QTU4g52s7lau/7mRO+FKfxbV4SswoVk12kb0rW2WGuJdl3PhpU+Cm1pCczk5DXGk/i38NMR8tc=@vger.kernel.org
X-Gm-Message-State: AFuF++knDkazH/MjPl9wzt+ZwMSir0mhabBRg3qVYamKhvrQXlbGK3Ia
	9YsGeIM+H01v0ppUQJ1+6JhuwEhdwEnqVwpN0AUMboLUi+xVs4Eh1u88
X-Gm-Gg: AYBFou3n3wvFBzewmrYzwoWe3XS5nXjFctNglrdosVgfdZpIKRHBqf98zqxiqVXwiCm
	VHvNyaP84jevVvT13KvhSodMabvQ25XipVgBLmZfCJzkcv9Z/jDD3KSmhuL7feN4BwOJaQrnN+r
	ZMorAgIHCBDKcslOu+s0zr46l3CrfJ9DcewqEWJ/r4tab2Mswh1jvq8oINB7LHWuG/9vt/2YxSg
	IKEI1SjLAs/qu/E2+6kCsYk3ZhGjhyMerNLpdJO3dHSPVn0QOPcyvH43nvTiGo4CTHLUXv0k3Mz
	SODgvnHbci31IN78HchBBeXyfB7zLxqLqKxETgp+VrfO0k1RVpAP4E8wuKmANHVVgfe+DIC3CXZ
	iTV6H6Am6erGwY7x0wlesSVlq4rZsnWtPFciDDAa2ZUqoKc1BHXLD3M14n2OnetbCjvP2g23lUp
	NGL0e8Y2lH6uIrleowGpGyJXHyFovT0f+L/zIlvmF2AzqRBoxfX3tzymW70XZA7kiqYQ==
X-Received: by 2002:a05:600c:b95:b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-4a168106239mr48095905e9.34.1791060501594;
        Sat, 03 Oct 2026 13:48:21 -0700 (PDT)
Received: from ?IPV6:2a07:b944::2:2? ([2a02:6ea0:d411:6008::31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm191511305e9.1.2026.10.03.13.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 13:48:21 -0700 (PDT)
Message-ID: <591a1789-bed4-48ff-958f-867f8688a8ac@gmail.com>
Date: Sat, 3 Oct 2026 22:48:17 +0200
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [musl] [PATCH 2/2] man/man2/fork.2: Document glibc and musl
 relaxed fork->exec AS requirements
To: Trevor Gross <tg@trevorgross.com>, Florian Weimer <fweimer@redhat.com>,
 Rich Felker <dalias@libc.org>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
 libc-alpha@sourceware.org, musl@lists.openwall.com
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
 <20260923233818.25289-3-tg@trevorgross.com>
 <20260923234714.GB23438@brightrain.aerifal.cx>
 <lhuqzihxg1d.fsf@oldenburg.str.redhat.com>
 <DLU5IDY7FCX4.OWYMCXDOF2R5@trevorgross.com>
Content-Language: en-US
From: Gabriel Ravier <gabravier@gmail.com>
In-Reply-To: <DLU5IDY7FCX4.OWYMCXDOF2R5@trevorgross.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 8:50 AM, Trevor Gross wrote:
> On Fri Sep 25, 2026 at 2:54 PM CDT, Florian Weimer wrote:
>> * Rich Felker:
>>
>>>> +On glibc and musl libc, this is relaxed;
>>>> +it is safe to call non-async-signal-safe functions in the time between
>>>> +.BR fork ()
>>>> +and
>>>> +.BR exec ()
>>>> +\&.
>>> While glibc has taken measures to make this mostly work, especially
>>> malloc-after-fork, I don't think glibc has an intentional model for
>>> ensuring that arbitrary libc functions work right in the child of a
>>> multithreaded fork. Before accepting such a man page patch, we should
>>> at least get an official position from glibc on whether they claim
>>> this property or at least aim for it.
>> Far from everything in glibc is fork-protected, so the statement is not
>> true today as far as glibc is concerned.  We try to maintain
>> compatibility with existing application requirements, but the precise
>> goals have not been written down.
> Would the following be more accurate?
>
>      On glibc and musl libc, this is relaxed. With musl environments, it
>      is safe to call non-async-signal-safe functions in the time between
>      fork() and exec(). With glibc environments, some functions that are
>      not AS-safe may be called between fork() and exec() may be safe to
>      call; however, there is no exact list maintained.

At the very least, it shouldn't duplicate the "may be safe to call" 
clause :p

>
> Open to better wording as well, I'm not sure sure how best to express
> the glibc case - if that's worth it at all.
>
> Rich, is this reasonable to document for musl? It is a rather helpful
> property even if not portable, but I'm not sure whether it is more of an
> implementation detail for improved compatibility vs. something musl is
> comfortable with users relying on.
>
> - Trevor


