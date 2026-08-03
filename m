Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1B2EB859
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 19:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786325; cv=none; b=JvFKKnKBLwqLrdICa+JN/GN+9mVmL+vSgEPUijHshsOsJ1fYzJ89KbckLGCOCbItAsj/3LsbTH2M3odnp96gieQ3iUNj/vcQ3MEgg0sJxCp1ODly6AWwqGJr812p1EbEJSeVsr51PhNIcLKIrU5JalMZeVS7OFVfCufY8kIkweU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786325; c=relaxed/simple;
	bh=b29A36JbEZ3OYfkUXi/C+X027Cm8TFdeQztnuNT2QqQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gMNcpp6Z3QwBEEuqzM5RfuMGNtLQtCdyiFWJlnCvMDYP9H48vQo2/ayvprbs0acQxEjl5jRIBZPsPQtDgtB6LW6t4vlO4V76xjZA3WnwjsboVv1YuV4Jv9TPfsik0JQYt9QQXDEDW8br5bV8qTxu8W44nCojjZjaAM0ccwwwHIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UgBoGm8M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kIBg136/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgBoGm8M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kIBg136/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785786323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60wRXLpqnOH1XlO1FUVwa1AQvKxOn1Oniv87sNdgS+U=;
	b=UgBoGm8M5X5zeMVBEnQuZv/pUWvB+q5KLgt9TjlUQyrHUuGq7RvgsK5Hs+FyCiO3TenDUw
	hrqpL6kyauz1UtWcwyDKYxJEhH1aqhaQ3+nl7sYaFVhZVXDOT2ULjzjPsnFQjsfPx2ssVv
	4aJILoN5nFHMHmxGQV3Y2rjp3qg6ajA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-Aa_u2ndnPp25dvjQWF46hQ-1; Mon, 03 Aug 2026 15:45:09 -0400
X-MC-Unique: Aa_u2ndnPp25dvjQWF46hQ-1
X-Mimecast-MFC-AGG-ID: Aa_u2ndnPp25dvjQWF46hQ_1785786309
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f726186c4so2641786f8f.2
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 12:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785786309; x=1786391109; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60wRXLpqnOH1XlO1FUVwa1AQvKxOn1Oniv87sNdgS+U=;
        b=kIBg136/1hRo8vb9KJKuwWD4v6ERGPkBG9DEOYFZHAzSS8O3LAqEwwZzXDRf0jT+VY
         Q4zj5e2lWCkiULhHSPhMrqG7wGazSj2/Fku/4QEoPJ1xJVDbUHbruhm5RzDlkafyCXB4
         SxmIFnKnuYEtXpRJ/XYP9OmEXlnWzrpwHSfhYk7CtGLX7cBsLkxguMGyg7zLT4W9HiTa
         laHD1JnwTqsVV60aqp7ZUdFC/V5Y8WVV011xld8jz5Cpz9CuU2ByLiyy6uiZjqNIbU0J
         Png3U3n/EyFtKUetoHkIqeOZkEuJ2p2TMxF9AvicdFoPYWyhiE7UVKM9M5wXm4ya/58C
         yatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786309; x=1786391109;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60wRXLpqnOH1XlO1FUVwa1AQvKxOn1Oniv87sNdgS+U=;
        b=fSmiDQ9sAXWV7wSTJ7gj7TWGrFZNH2bFnxbIXlnP2jd8aGW34Eo+sbOZs8PPjc7bQb
         3bP9H6bWUcrxzxROLpV4Zss28QLG6XbUru9OL5WwnX8LK087zS5dPGpFHpgF/b0l3Nqv
         nD2l9KlTsd+dhGsnm+KKX2rK8Z1mUUZvW7OKEUaIwuwwuhzI3V1gxQJevvELT+t0wMJg
         HqF/p0aBLSht8XXll34Vovl7vpSAUPGOVGbwgCfzxLv9EqPnTL7G6UMTnnbj9/19OG5/
         YFgOoeYf2Ug3Q9oLlDqrIQORs4CopNt8wujXpV1sd4dyA7QQeG5hJrvgOKXpxD81r1Hs
         Ef4w==
X-Forwarded-Encrypted: i=1; AHgh+Rq0PuhI1zHrcrJsZRQ7tkz4Bq72MmtZdHs4hfuBNnZJMvh56iePyTbYBUOZv9SKwHnn6Fj3skjYruM=@vger.kernel.org
X-Gm-Message-State: AOJu0YySaQ1FkXzEYWUBldlw5VNBEPRTsV5vEo5xhiPaoWSsP3zmPqmb
	GlhX5VudnVfHBQDey/UBwdKBHKIs1VvWg+74W07ggFy2clBOarZuEoY98y4Ex+2cxccJJGmIjQf
	N0TGCsulihuBiXMfEmm5ZmsRIeldsdm8RikBQ06OEe3dSEktNPzXNnutyL5KYvw==
X-Gm-Gg: AR+sD10KbjSHWTWc0HHL37f20Mf+5QJWccHKpcqDCR1gHnbjsXpG5MVGWbLsm1ioBnE
	VmkrVoaAnzLod/boYA9108yLA7jfMV8/eXXTj6jzPNuhsi2QwzzjOgZV6cqwwOpZRmj7gE64g0p
	FpHck/L3s0sADu6d/+cQRNUawLVkAOFkaeC+o/0KlyxWsp+WmhQtnv8pMdpnpCwQvcz6i4xJ3it
	59sYhsiZWe/EP6tsUuD1nZCwHE6fdh4u05ClqyHi1e3YLCG6hMbwuW/p1jpExAUz5zIfbR6L6WH
	Tg49FlQ5CA3+GlLjn5JEG69M/Flr7BH70mB5i0g+m7yhZ/+SnX2o7+G65o7bcZNcebQ5j17goY/
	WoXGVhWSp1VJ0K/3b4uHSn8CWWewAFKM=
X-Received: by 2002:a05:6000:40d8:b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-47fd9f91a11mr30108651f8f.6.1785786308665;
        Mon, 03 Aug 2026 12:45:08 -0700 (PDT)
X-Received: by 2002:a05:6000:40d8:b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-47fd9f91a11mr30108627f8f.6.1785786308366;
        Mon, 03 Aug 2026 12:45:08 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e296csm32878004f8f.12.2026.08.03.12.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:45:07 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wqyaw-000000012QF-4871;
	Mon, 03 Aug 2026 19:45:06 +0000
Date: Mon, 3 Aug 2026 19:45:06 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
cc: Bruno Haible <bruno@clisp.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org, Collin Funk <collin.funk1@gmail.com>, 
    "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
    Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <anCO9tDqJH2PLD0w@devuan>
Message-ID: <16f3f33a-85a5-5165-7d99-a3f85d857e50@redhat.com>
References: <cover.1785532392.git.alx@kernel.org> <87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan> <4636165.RUnXabflUD@cagnes> <anCO9tDqJH2PLD0w@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Aug 2026, Alejandro Colomar wrote:

> > That's basically how it went with 'gets': The community realized it is a bad
> > function, then the implementors started to withdraw it.
> 
> Here's an interesting story about gets(3), which I learnt recently:
> The C Committee didn't remove it from ISO C.  It was the Austin Group
> that triggered some unusual process within ISO for overriding the
> C Committee, and removed it in a secret meeting.

That sounds like a myth.  You can easily read the October 2009 minutes 
(N1475), item 4.27 "On The Removal of gets() (N1420) (Stoughton)".  You 
can also see C99 issue 0332 that resulted in the obsolescence in C99 TC3 
that was followed by the removal in C11.

-- 
Joseph S. Myers
josmyers@redhat.com

