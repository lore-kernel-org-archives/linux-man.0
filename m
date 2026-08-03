Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9972433BA2
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785496; cv=none; b=QTiuRTGgCBLI7dF75OPQAHKg1wwoTR2gIf02/1dhXyr+HXDOH/jhhifAXn62lbmeuGf7bIBPEYgE4qc/+pY+r2Eny64g4pVKHWvRdI3KNp7no/0Mb+sRWJw43QZnS8gU0qT3D5e4BiVK5lzHF5gaWGMVA+EGCqt1fpHH6asP2io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785496; c=relaxed/simple;
	bh=gk9PyFHj6NGXvx1ofN2MOH6gD0NqlIgw51/loRO+IE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RzO3ifhUD00Kt2/yHHDt3pdHifouHm+HwahI+WJKFT8is8hA+1X7zCro0KptUsGsMSmwGpTTlvXTKUhchqDy7qgEn9p8Jv+goaKfRuUwUfXclFjFgEzy6yZh1wEzrbn9cikkZdJuwYIncJUbjRlN+P8jrbfCXwAk6amTYz077zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hNBTdOGu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OfhxvZt5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hNBTdOGu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OfhxvZt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785785493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8TcgkH3QZtIpTxqGMK1djxKUEAzr4DTk7xVT/C1YFGM=;
	b=hNBTdOGu3WRHR7aR6xP/QQLZMBBgMq8WWnu9ZMbfnFFLoOkF2z9epXTDl/H6GxDIrg+GGf
	G9kfe+WIIopaI1TU7Z3oVUrzNVp/XeUGDkLyuvypyPPq+qb35dBCGcXBmPqKOd7ol2yeJJ
	cyMp3fiVJcBqdU5rvaCWb+pPa0IRfXw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-jKoJYDiRNcKhwSX_RqMZIg-1; Mon, 03 Aug 2026 15:31:22 -0400
X-MC-Unique: jKoJYDiRNcKhwSX_RqMZIg-1
X-Mimecast-MFC-AGG-ID: jKoJYDiRNcKhwSX_RqMZIg_1785785481
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767b782so16656495e9.2
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 12:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785785481; x=1786390281; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TcgkH3QZtIpTxqGMK1djxKUEAzr4DTk7xVT/C1YFGM=;
        b=OfhxvZt5dX0AUQsc1oLwDiKk+1h/JO6utSbq0unxV8D8kj0xBg6J/uYX+KBrX9h2Pe
         PfEVy2GSQpMMoS/ZWkMrtzxZzjnVJpgEIeQJlmWR48h/Dnbi6RRc3D2Lnf1QqfwhpvGD
         zmd/yToX1ZNqgY6TizPTIw3vgJy4PHq6ee/3gByklZEH/RpS5O8qvXs0idVOVRtuPgXP
         r4Kr1eL6x8g+IZLlCdRs2C1if8LqHzRg20sL1jTUti15FAC0RVOuBnWXRJxyso2moJEJ
         6jth/kuObNT1KaLWmK0SMh0dA1BvA9NZefOACwABZmIas+VGuyu0USstgUzqDgUyO00r
         IxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785481; x=1786390281;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TcgkH3QZtIpTxqGMK1djxKUEAzr4DTk7xVT/C1YFGM=;
        b=mRRxovh9PZ3tJXuS3aiR3Q3YIyp6GK1Ukiy73SkKQawAg71cvyvSAiFk3o1cozD0Yu
         HZiJ9KfCMtwPlC0v9QhZLZbGHShqCgybJNhjtfqESFlyoAHZbbScx4gnok72melpkSLE
         fj+OHtYpWf3cw4Gdldq8yTyYnSmMzOHFYZ0KM0wYK9Uz9NBBaGRab6h2fMd1CzZ6wCWg
         xeJ5BTMKIKqirx4snzpv3/v/7qItRle9LS9zxCK7HTtqPlJPf9xM3xJIfBfcrW4SjryG
         mJwvS7sdDwIoU/ktmzZWAyZCxHVRZSSYrTD7ev+4A9Dg90ffh8tvupvSXWUs885lb9Hs
         K/cw==
X-Forwarded-Encrypted: i=1; AHgh+RoRmiONugyG8cMl0nj4GAoRFnOimw+E4UKb84rkGOjCAcLZAca6J7C6+13tNyaZGeq3Bfmehsq99Dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSW+LYV9aZsalw58yTcc45Y4Zd80j61WNZB7i+WVOxr4yxX82
	0/f/rOCzZxexXJUImCuDV0/8EYgU624TmQ+E8WpSFXp/s4djJOS4o5eeK7aKQUZPeR7yaKjAFaG
	p8K14jcHv5wYo++eOiMKhhHvKAu6CtPBGFxIWndZs4giIdou9tfILFEvZ5p4z7w==
X-Gm-Gg: AR+sD10zOH92IIThxETb+e8TsxkGy2IEFk+wrcBjo5GmO1mU3qX2NwjFP1XPnp2lAXk
	jT7tbDd2EhkLhlCA6RzF8IXR9BTLfy4MdfrFQHjVqv6zHZSAi8N6Qm3zlGXVjlbJlufq//lJ56n
	tPu7kl2KpbB/YMCyKjzLn4hND32ASU0VMQDgd9V+Z6w0Z1KsJ09zneyAfQc3GEvc/YcwhQc9BI7
	e/gVAnD47rmHo4HBTY01UFH59J2Rt2niQ7zA3SGjeUv6QnN01W8DAdbO+X91Nwi//PL8n3T44xm
	WMWl5eLElAVStm/5geXD9htUBCkq2vPtPWhpGKbpEpt049rnE5VGyt8Thb7sWOCQ+nwEvOd14Is
	uI66UErduD2FdN2ky26xlWk26eVgEfSU=
X-Received: by 2002:a05:600c:8b13:b0:498:8e6:d464 with SMTP id 5b1f17b1804b1-4980c65cd2fmr273846725e9.14.1785785480925;
        Mon, 03 Aug 2026 12:31:20 -0700 (PDT)
X-Received: by 2002:a05:600c:8b13:b0:498:8e6:d464 with SMTP id 5b1f17b1804b1-4980c65cd2fmr273846285e9.14.1785785480572;
        Mon, 03 Aug 2026 12:31:20 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0fc94esm19496165e9.12.2026.08.03.12.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:31:20 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wqyNb-000000011z2-1AkP;
	Mon, 03 Aug 2026 19:31:19 +0000
Date: Mon, 3 Aug 2026 19:31:19 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, 
    Collin Funk <collin.funk1@gmail.com>, 
    "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
    Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
    bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <am-2d02e1qq78Asv@devuan>
Message-ID: <e286f321-28bd-4085-7fb8-20d103cb21a2@redhat.com>
References: <am50AM0bdufHa9W3@devuan> <15288158.RDIVbhacDa@cagnes> <am56ZBzNM5J07AUa@devuan> <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu> <am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid> <am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan> <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk> <am-2d02e1qq78Asv@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 2 Aug 2026, Alejandro Colomar wrote:

> If <string.h> was described as providing functions that exclusively
> handle strings, then programmers that only need to handle strings would
> naturally self-limit to functions from this header file.

A one-line change to the description of <string.h> in the C standard, from 
"String handling" to "String and memory utilities" or similar, to make 
clear it's *not* (and never has been) exclusively handling strings, might 
well make sense.  That's all the change that I think makes sense in this 
area.

-- 
Joseph S. Myers
josmyers@redhat.com

