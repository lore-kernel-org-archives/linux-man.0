Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E3386C21
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 02:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785811187; cv=none; b=nTWVCn9e8Cr0yRLBhOuiGG6RV7yWGNm76k4we7/pHHw68Cb4sSpARwq6MI1E4fcRLCu16xNG3sPI+y0L7snDXHiF4KmBOkUufyv2RkE8mlQJbsBfFXctMRkJeBryGFs8EOuvuOfCwwydlwLM4QUGgH0DFTSByuutaqc5qqSe6hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785811187; c=relaxed/simple;
	bh=GUWZff/docn7n02Y4KLzUFnMfEyPg/EWFRGMohfSgDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=af95SAmxPkak0wZl8hYc9cLC2hpdg9FSbg7mzEssHazgYIBp8I0Exv54PEDByDvZUSjz8Q6YAaKHg7iioAluDcu+lGlnJWrnd5v8ye7tb6GomelnrWb1mJnZzty7HmtuELcd8otm/OpNY+M5eqYdMDvoC5gfo9XjF3ZzHopHYaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8quERl8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8quERl8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf27856f9cso40709495ad.2
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 19:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785811185; x=1786415985; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wFbcJ/WMNgmznNLVN0s70yhlVUYmYiM6L7oFFV4a39w=;
        b=Y8quERl8n9nyfdNB9eC/uiEkKxMLt2gAAG2DpWb+B2GFF3uUFrBfZ3+bNj+qBQMtK9
         KAvCh1/hR+ls4hvX4/0MfApsk9D1Der/FfKZHjAnj0U2seWMqpA+S1hmyHq+B9R3toz4
         +egHDh1XZtEpgOgCoUhSvYk9i48pS8clGw6+IKMY3IofBHmhEBoEGyj6qGGuBrjQKok6
         of7aXF7VXFfbDcosXOyh1jm6lBORRYlJxLTaNu042RIQl1QyevFmhYDbVfSWKSWYZWO3
         uU2Y7jnbCubxB/QTJUa91BL7lBdUgHNI9qI8oEUiCFs16ki6gw9N54sDQwyag2il5Zwk
         GE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811185; x=1786415985;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wFbcJ/WMNgmznNLVN0s70yhlVUYmYiM6L7oFFV4a39w=;
        b=TfbLPKdI5GmiF1mG2XsONOThUKdYpysoPMZyJeeVPaCMb5fZmJXKFAIGVTFkp/fuO9
         Edrftyye8aEidNbaJGInQzRuSRy4kEVPy9sGMEkkLtsl6mrZSI3wT1mfb6FNSIctjxgp
         buUCdCOM+K1Urr8QB5No/NywVRJBSFlpj4UBwYrKWgf7/FcRsxD3c8kdmEa6RkhYlEIB
         XbQ1INgs1Uezal7gvIknyRKR0AibiaE5bT2tJdAvrnHMH4VexALGd+dKz7Nla1tSRggr
         TZAPm8XQNYRncCw69V+dmEgKMz2FWh1jhP6MNtjsNJsNK7ioqkSuLEisXNeQV8iqDUGa
         a1VQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfKHsyUA69PrdLd+UZTBG5Hm6MrHegpQZ3rABLeEKLNkoiB1gp2r7QLkTme3hD83QUO8FNX/7ca4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhhCPH6rHqjD3bvU9Q/mHnmX6e7DL25DCtnqJiCjOPFFq8UH9/
	N7sXYONeJ1PEx4FujnMkQMdCZ1tweDeXrXbEO0hHV9n9hrs6soduqt9c
X-Gm-Gg: AR+sD11mxppjFBxNnaDIxQX7bzC3e0v/jHElxKMBaJ+/NFGcf+jZ9Ov/sAnTEppZr+O
	ldmD7rri0Fyt36kUEUQ8gAly2Q1A6+1JXWuW9xbbrfxF3BwV0ZC/4wyOIuAhbKnE1B+5oRUNtGi
	rBw8J6MVZK7VCW2RWrqTyPiTLl0zZ2SOqAH2V/JS3pqIQhakuCbV/Os7RG7Cfxi4qlsL0oJemu9
	p+POkAt+gZDeFjQbGlE7ADkXJs870mvMH/mtzsTTvGS7UyVO5GzwGUNkNJUe041vXIY/7d7jSgf
	ug3i73FMOGS5WhcrNecqfiaOXccfTe7zrto546EWH6mjt5N0673p/lW5Wd8bFygdOb1Cycg/llN
	XSWt1jfepZsrvk05NFOIgBF7q7UdrtgaaApESZCTFRUzyeM2DBT2DMiVvUZTS9XKwaml+n59Qa6
	InCLlrP7K7L6FcwZ5P+vgfWwtSv/ojTA9RfggFi/nR
X-Received: by 2002:a17:903:182:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d0521e9560mr114848505ad.1.1785811185135;
        Mon, 03 Aug 2026 19:39:45 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::4bd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5c7sm49046484eec.5.2026.08.03.19.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:39:44 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Sam James <sam@gentoo.org>
Cc: Alejandro Colomar <alx@kernel.org>,  "G. Branden Robinson"
 <g.branden.robinson@gmail.com>,  Arsen =?utf-8?Q?Arsenovi=C4=87?=
 <arsen@aarsen.me>,
  "Maciej W. Rozycki" <macro@orcam.me.uk>,  Paul Eggert
 <eggert@cs.ucla.edu>,  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <87h5lb9u8d.fsf@gentoo.org>
References: <am6CnOddgaM10pry@devuan>
	<20260802000833.zpu27l7ibvrbouna@illithid> <am6PkypxYg-Fq4Iz@devuan>
	<87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan>
	<alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
	<am-2d02e1qq78Asv@devuan> <87ik5sunm7.fsf@aarsen.me>
	<20260802231058.o7gud4bd7co2nbhv@illithid> <875x1sp0h2.fsf@gmail.com>
	<am_TTjDLlAI68zkp@devuan> <87h5lb9u8d.fsf@gentoo.org>
Date: Mon, 03 Aug 2026 19:39:43 -0700
Message-ID: <8733wusj68.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sam James <sam@gentoo.org> writes:

> Alejandro Colomar <alx@kernel.org> writes:
>
>> Hi Collin,
>>
>>> Date: 2026-08-02 16:27:21-0700
>>> From: Collin Funk <collin.funk1@gmail.com>
>>>
>> [...]
>>> 
>>> I can't help but wonder of what happens in WG 14 rejects this
>>> controversial, as obvious by this thread, change. Will the man-pages
>>> changes be reverted? Or will we slowly watch them document personal
>>> preferences instead of existing standards?
>>
>> This patch set is quite independent of the standard.  It documents a
>> header file that has been provided since forever in glibc and most other
>> POSIX-ish systems, so changes to the standard are unlikely to have any
>> effects.  I've clarified this extensively.  If you want to discourage me
>> from applying the change, you should rather bring up technical reasons.
>>
>> This passive-aggressive message is not something that will have the
>> desired effects you could possibly reach with technical arguments.
>
> I didn't read it as passive-aggressive, but I will say that I think
> you've gone a bit hard in the responses to Collin in this subthread, and
> I think the fact you sent several followup emails to yourself indicates
> perhaps things got heated in the moment.

The last sentence was probably a bit rude, sorry about that. However, I
think a reasonable third party can understand my frustration. Almost
everyone who has responded in this thread has been against the change,
and have spent time writing their rationale. They simply receive a
response that can be summarized as "strncpy and friends are confusing",
or pointed to a much less commonly used man page which does not align
with standards for historic reasons, or told they are not rationalizing
enough.

I no longer consider this thread a productive use of time, so I won't
respond to further messages. I am happy enough to fix the SYNOPSIS of my
man pages locally like this:

    $ git grep -lF '<memory.h>' \
        | xargs -n 1 sed -i 's|<memory.h>.*|<string.h>|g'

Hopefully distributions consider doing the same.

Collin
