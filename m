Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EEC411695
	for <linux-man@vger.kernel.org>; Mon, 15 Jun 2026 17:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544023; cv=none; b=Z2zoGCdQ5kGqJ4D+6zEjjEI77Od483wpsBhUtN6RRnWTqnwv2976MZhUcnKqPLbZF0Xt7xjHSog5EjhGNlj86Frk2VQvCRBgR3Mv+uYG/Mp4uK5pF5DhHawzz6Pc55Iazc5t3kI8Z8kznJRv/yLe3E6Q7vaG9/d/FKHmiQeaDJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544023; c=relaxed/simple;
	bh=Yp3t/6FXQ53m4ca2k/rCoUV9iYcrLqqsFm0G6PfNT1E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IjOrgbFMYjsJ1Gr8zW2dZx5LY5IKJ/l8Z3JiQpvh3AYxbi7OXa38lQvflQ5ljr4dzYtfEVDYa17aneWslV2SBqOqgcg8TDGpXxDUaugWPb8JqF9pwNbP8TZjjp1P3zNw1QYmouJq+23AMeNOgqCXgua9Ax2xCKhIxfIvPgRjXws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TMmko/wR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=h+TMx0Cf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TMmko/wR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="h+TMx0Cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781544021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N0qmvqlduDIBhxyKNRcOm6y+yrmTZPvXSiR0UoVqqfo=;
	b=TMmko/wRR2gAZ8pzBN8rwNNMRBB88FBQlI3X5YNWbKq4SOBsdu8O5sFYrrXd+Z+CdTjA7f
	fNj6EZDrEmo24Xt1NmADGUFXEDj/C1KbfLwLKcTCD9kyHUTOIeUfSG9FLXe1LS3/4+yKXz
	69jiBHD8QagtYrHQm5PuBNHrwUf8fTs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-ZcXtNnSpPsuo6BR6EBRvfw-1; Mon, 15 Jun 2026 13:20:20 -0400
X-MC-Unique: ZcXtNnSpPsuo6BR6EBRvfw-1
X-Mimecast-MFC-AGG-ID: ZcXtNnSpPsuo6BR6EBRvfw_1781544019
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45ef6b407b4so1715824f8f.1
        for <linux-man@vger.kernel.org>; Mon, 15 Jun 2026 10:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781544019; x=1782148819; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N0qmvqlduDIBhxyKNRcOm6y+yrmTZPvXSiR0UoVqqfo=;
        b=h+TMx0Cf66N7Jq+qrQ470KimdgRp+p1mDhYBhlmMSS/qKFwPh9Eq6ynvuTIZZmZ7/O
         2Mzfh9gG/2+uzguLtY+7n0jAa9WT/to19JuK773PpZjRJfxnfOINZdJJRGzf7yVSxjQY
         xWnTzu3RTKBOKRTTKecgO8UmTpy4kW7F8Ye6OqWyrKrk4gzOWYXR7fu6VVgsUsdOhGln
         6sDjk4blBYjs3vDBZq09OHAhN8OHrDODIczw6o1B35gfbpSI0Ixga5TR0KhYD8EJE5q+
         xuzIH25KTLT/b32f1HK7Wz+Mae/V9c6js8wdvKh3Jdeud3RkpNaAbXXyI0567+Cll/UZ
         aCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544019; x=1782148819;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0qmvqlduDIBhxyKNRcOm6y+yrmTZPvXSiR0UoVqqfo=;
        b=WdgsCLcflKFBKcvKFlloLbi9iHreVPzwobuAJ5u/Bm9+6jFDZ6cyjNs+Iyz4WdKQ27
         PSuJLRMS5I+rpKkAhgFXIQrSN4lX1keVIFQwl1TAODbZRp1NE+tLfH6wwqI5BK/eFYgL
         Cd1m1yfUoaVNiKEftcgjWE++Jr7QK5KPwtLp81HO68B+R7yPp4F9e8dFPj5aD2GhY5hw
         nZ+4ZIBd+thfZGsaKOZ29tXnUCPrkiuBuinVXTB9mMNOTPCfB86Q7pq/zbZcyJYXXDOr
         gN9whmpWugteaJtRUTYvwryjw8hLyN7iDOgINtxBb3maZYgh3ys/+3A2xPCF+cKHiMPj
         eJZg==
X-Forwarded-Encrypted: i=1; AFNElJ/u3fW00Yob49U5iSR35Zm/Z4azbb2AkGCs2NQpR1mnXhbtSITavfjThINgBjGwkdCftEBvT7RL1SE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw5P0D1XvJpMZ4bEa4xXBGYGaCqkaH3GDRk2sIkxkiKec2RE0U
	o6XySu4Ep8bVudFR5gMisaCAyMWiEhdeRJ89NG6VLGy2Pd4Rzhnako3StKYkSbXB9TYExKyyyia
	3SaklhjPlfPShcKqPKDdR8zXN/3UW2uy/adfj4M0WjAHiwykoZTLVSX/1YUFEAQ==
X-Gm-Gg: Acq92OEMt+Rb0QC5DmsxRgMHutjd9LnvZmuchq1x2kv+SK0MAqqMGg/3ZACRIWTASva
	eFyd+WODjDSHZPoRQD+eIfzCQmlLAhmMvCEglDecry8mV1UZRKgoE5EgshX66s5U4mk5zsckxmW
	R0xbKtsDA4BBZNfyrgenBnymclCZLUaP8yZJxqUQ168vFK8kwhcXRTTdlGqgMY+wpP/Bw0vGS9h
	MEFfsyrE1KqO87dC15TrWsMx1TMjk0Bro43V3ZBhiJiiFWXCKGh4gu8l8YWoYWglhHJ6u2GjqE8
	zJrTwGb7IipHKH9Yq5sPv9k8qozjUC6PMo0DJcQWNQRjfeJnTaXKLawZ910srcLac0I2rBxt0ZA
	X0utC9N6y6fv6H0Zg8zwSpIT0zZkDptNr5UHYLCkgmgWNcF7tMmAv
X-Received: by 2002:a5d:5f43:0:b0:45e:f765:ff9 with SMTP id ffacd0b85a97d-4619f301c5amr733622f8f.24.1781544018787;
        Mon, 15 Jun 2026 10:20:18 -0700 (PDT)
X-Received: by 2002:a5d:5f43:0:b0:45e:f765:ff9 with SMTP id ffacd0b85a97d-4619f301c5amr733577f8f.24.1781544018450;
        Mon, 15 Jun 2026 10:20:18 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm38280661f8f.5.2026.06.15.10.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:20:18 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wZAyv-00000002fQG-1dqz;
	Mon, 15 Jun 2026 17:20:17 +0000
Date: Mon, 15 Jun 2026 17:20:17 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
cc: libc-alpha@sourceware.org, gcc@gcc.gnu.org, linux-man@vger.kernel.org
Subject: Re: _ISOCxx_SOURCE
In-Reply-To: <ai1DVieT3gTr4J5S@devuan>
Message-ID: <c357346a-ecd1-761e-47c4-5c1357b32c59@redhat.com>
References: <ai1DVieT3gTr4J5S@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 13 Jun 2026, Alejandro Colomar via Gcc wrote:

> I was reviewing the feature_test_macros(7) page, and found the
> documentation of the _ISOC{99,11,23,...}_SOURCE macros to be incorrect.
> And thinking about fixing that led me to think that the design of those
> macros is less than ideal.

Users should normally use -std= options with the compiler to get matching 
language and library features.  These feature test macros are mainly for 
niche cases with old compilers.  So I don't think any new user-facing 
design for them should be added (the C23 and later ones already use the 
newer __GLIBC_USE style of conditionals in the header implementation).

-- 
Joseph S. Myers
josmyers@redhat.com

