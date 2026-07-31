Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2157C381E86
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 23:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539539; cv=none; b=P0m/cYdkku7TGC4DW7BUw3vtGos1aMF3Slsadhtzho0USha8Q8mZ9VlwGiPqYvoog4NMXE8vuppiNnKBXJ4dGDRyKW2zSPqonVFrYjfr1adeDdOJ1PRRhyXyVOJL1P9mV9CK3U5lp65EUFkJN4ERS6q8W5FUONOCbp6h0oazep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539539; c=relaxed/simple;
	bh=qQwDlVZ0y+Ns2+FluZ0ZaIcELHvxFEVQJ7zat04/17Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=If97bpyr4KbfLF4zZEgMdy6WnZQeuAN5biEzxAxN8xVSvxKlUzMN9wYK3vwUyUU5qtYi37/21RAXfAoirSc/8AIeOOECwbWlvsoOY+RdxlhMkyoRjWd/mlNaJ6160txOviARhPsu8yPejXDGVaGU6YzbvzxeLTesr6y048KhBhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QNPUjWFV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FQYynIeS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QNPUjWFV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FQYynIeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785539531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sBxJEEW+ATa94ywPO6iUl1knTCBN0xMQtHPDURM4K08=;
	b=QNPUjWFVMDaCUpavzuEvY+NlOgzT8669kwV+r1FJJb5R58nfDhNh+JE+rIhMa8tAZxld0C
	1egzdWvorYuL4TIUF2/SxQmVc8ZTrL8bsJDr2+3SyllVNfEEpzCXoXBENaniMGxYRMAVjg
	LG5rfPS3l6WD41oGzL6WAa+ch/Q8OlE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-S7P0hcELOkm1ULsY2-DHYg-1; Fri, 31 Jul 2026 19:12:04 -0400
X-MC-Unique: S7P0hcELOkm1ULsY2-DHYg-1
X-Mimecast-MFC-AGG-ID: S7P0hcELOkm1ULsY2-DHYg_1785539519
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f835ac1aeso1253478f8f.3
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 16:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785539518; x=1786144318; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBxJEEW+ATa94ywPO6iUl1knTCBN0xMQtHPDURM4K08=;
        b=FQYynIeStE0tuGoT17eKb2xcNBLZxdkfeYuzFaUulSVigSfcgHcaRXY0UYuEgLb8rl
         GMBPy77fg8mN5odFF/rz91qXXbjZYMlbe60Gkj5+IEa3JdNcQJxOilfwQCok9QqE4vij
         Me06bbkxVDRTPcVUyaCwtEVkffSWZiu9uetQ/2OWtbkrYgkKhPEkLotbWn+XPgJWA5hJ
         ceX4B7jEL2YF5EojsvOuFo/kzTh34pcDGppDlYFa4aSWsUKaePMHWJO0aDzENe2Le4aS
         XVutG0kq8Un+Tm3IuMUSrNul+dz/pUSb8zwX+C5lmu7bJN25QHCsPmwzh8B6o+5pNmY6
         qeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785539518; x=1786144318;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBxJEEW+ATa94ywPO6iUl1knTCBN0xMQtHPDURM4K08=;
        b=rEV6AwUOCcPSo/dGmrsbbsed52xVt0EZJ2enTtHDW5T/65uAG6FN6Kaf9cs6g/7BEj
         XczGcXovQXrUwzT+UT4m34VVWs/8PhwsLM0PHCq+96WPBJt1Pq7TE/S5SuqtK2k4DPc9
         35iJphuPjxJQXdVVmFfZ9MaXN1aRCrOg+GnbIwxskCRv24DMo6OgrMd0SvW3ThsLszXs
         6YZ5uEBWSkBaWIeafDnpqbtd2J+LHmisOS4Pl3JdhFlPVC2IOty/KKmBgdQ8kJxycdSX
         9dEPvukJfjBS6OoxOTD3dlws3JdveA8nbTA/p42n8/RvrcJpgwYE3w+TQtHLW2jxvuDI
         prMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDpubtov8utLMKYNzB2Mf7qm1yiADCbwjRvc4uSIwfTA7UHVeB9tXNZelDVXNLZXYqZgK2xKomgto=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQHxqu8OL8iJqmVyDTuCjff8W2TocdYj4ZIAqYxuyAGwAUlg2Z
	07eZhHH/0xXb1DjqPfc59DOFbDccppgd+UBhJ5/quSWQEpbdxLe50V5kWsG65wYiomM2/Wo0FK3
	6ulfJMGEYrWiJuW1kI3M4cghEtxH/j2iZt7SerUBYE/W7xo2w/D1mnmt/JWYSiw==
X-Gm-Gg: AR+sD13FZ0JnnzV2hGbjm97OnZmCiO5zounmapbzjvwqW/ihykdxLM6Orz3bmwmxnmJ
	wM4vkdu8oZmqkQVfpQnwyoXV29t5z+pNwQYwhr0Niw/H7M4yD7Wo7smOqG1P5viZ/lM1yoZFKMD
	jHJsW7J2CtqrYAai6MA/Mk+CFW0kpPL2WFNn22O34xcF0nCokJtCKPiiZmNmqO4HtyuiWDlr1u/
	11iFotub0G8ZdovSmiel8AOWAoCV05GKMdJJThFBN2kyYfqMlVdKqxlDaYK3xbFPuzoVV9RIs3c
	fBgk2ZtiYC/Mm+r0G28xWIZRG/L/SyGuvSazUOYuLC/iA+TNEPc/McjKZAFQDSvWkjaBWxD1nK5
	1+hGPptNILRjbCzXaE60+Oy6GuxwHAEo=
X-Received: by 2002:a05:600c:4454:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4980c64b6cdmr1091255e9.3.1785539518694;
        Fri, 31 Jul 2026 16:11:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4454:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4980c64b6cdmr1090945e9.3.1785539518353;
        Fri, 31 Jul 2026 16:11:58 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808195136sm1033885e9.3.2026.07.31.16.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 16:11:57 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wpwOS-00000003Izp-2ts8;
	Fri, 31 Jul 2026 23:11:56 +0000
Date: Fri, 31 Jul 2026 23:11:56 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
    linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
    Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
    JeanHeyd Meneide <phdofthehouse@gmail.com>, 
    Christopher Bazley <chris.bazley.wg14@gmail.com>, 
    "Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
    "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
    Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
In-Reply-To: <am0lAEb1wuCJPDk7@devuan>
Message-ID: <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org> <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <20260731215122.4p4aepsbgeoibx74@illithid> <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan> <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com> <am0lAEb1wuCJPDk7@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Aug 2026, Alejandro Colomar wrote:

> > In other words, they were in that header for 6 years, and it's been 
> > implicitly obsolescent by virtue of the standard choice for the 37 years 
> > since then.
> 
> Yes.  And I'm trying to revert the implicit obsolescence.  Obsolescence
> isn't a one-way process.  Sometimes, evidence shows up, and the obsolete
> feature must come back for $reasons.

When it's been obsolescent for 37 years, bringing back a header with the 
same name is just going to confuse people with 37 years of past 
information saying it's obsolescent (normally if one source says "use X" 
and another says "X is obsolescent", you can reliably assume that "X is 
obsolescent" is the more recent information, even without 37 years of 
history involved).  Any reasonable change there would involve a new 
header, say <strnpad.h> for strncpy and strncat, rather than resurrecting 
a very old one.

> The solution of moving both mem*() and strn*() to <memory.h> and leaving
> just str*() in <string.h> is a consistent one, because <string.h> then
> remains strictly for string APIs, and <memory.h> is for the rest of byte
> handling.

It's inconsistent with how people have understood C ever since it was 
standardized.  Changing the header memcpy is in is just as ridiculous at 
this point as the proposal there once was to obsolesce NULL.

> It wouldn't be reasonable to move strn*() to <memory.h>, and then leave
> mem*() in <string.h>, of course.
> 
> Similarly, it wouldn't be reasonable to more strncpy/cat() to <memory.h>
> and leave the rest of strn*() and all of mem*() in <string.h>.

On the contrary, it's only the functions for null-padded fixed-width 
buffers that are niche functions causing confusion, compared to all the 
rest of the functions in <string.h> for which it's a very well-established 
and well-understood location.  Some others like memccpy are *obscure*, but 
not confusing in the same way.

-- 
Joseph S. Myers
josmyers@redhat.com

