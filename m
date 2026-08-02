Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57592EEC3
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 01:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785635347; cv=none; b=uHjrnke6Cy0BVamAL80jUm6chUG+6mpCV7sI3mH39aG0xa8rZ6hklSHjlui3GUntIR7bWl/JsX1zrlu5QstjY7D1YdiM1SCc3P+wLv6I68qoZtj+Ao/Xgf/O/AU7LeiighfPzHkUR+KSbbnBjIFNuYPKVFCqZhbai5eeDif6IsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785635347; c=relaxed/simple;
	bh=ZgOlkFW0BEDmCHhhejejIq+HO1B+T116HLOfkOMtyZk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LoGNB25c4U0AgCPnS51a/5dnlHslYRWxBPFWKwCBAPjxPiGYWQFzczAUS4RP1CzGfTmQPWuUzQ1PixIgaKcCPfGHRhXY3a/LvM29PKiLkDURjeOaLwMKr4PiE3uidPuUMvBBbJv0EMzu+JmoMTBKl53X6l2Ea7MWSURNgRP4P4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yye5/phx; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yye5/phx"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1881045b3a.3
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 18:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785635346; x=1786240146; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SlnHA0YyySkk3TPckT3XiQvdwdNwynEkUxwdxYnuKeo=;
        b=Yye5/phxx4eVmNgTNsOiVpLjhz0DkOzWe73v/NRhGWVFLiSqt8HGmDHt1nC6TD1+4r
         jhTZviyW3w7DsZMlDgCl2EFRXBVbfwOQ1CPEgxDlBLR6iyNzp2u6xjPowUClasQdGYP7
         QE6Z1jr4TLBE2x20A/w9WRZuDRTYWXPUS/7hmbyQh+4rJRZhjBmjU12H4MjiZa0BwB/f
         iqujEdbsBs5jHHsc2ddEseii/S01PsrpXE6j4PbTRKWkgR3ThKlxpoS6ADxaiJ+OHOld
         sp2gwkQTxVsnASPpTHvFYeHdEbWaowfZnzx2Gu1HDDqy+IQQLwJtXA7wb6emfeshoOgi
         RcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785635346; x=1786240146;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SlnHA0YyySkk3TPckT3XiQvdwdNwynEkUxwdxYnuKeo=;
        b=HVJr4FZGgeGpvF6QdaPRTKzISC4nr8ej25TCIOxOiE1Tf1QHACY3K5/l3EA49lDcE+
         SBh8jF8PRozVyiCINWI9PB+u28aVFVPRYzqEncPs+waWXFdmQ4Aj5x4Xn6LSH/6PR6Sd
         OqS1T9tXAP+YJ2Z+hE6MDANMu9JoHVUBtJMrQFpUL45edz2VR6e9GaqW0nqABPEfUD11
         ok25XR0MkGtMRfpsvfB/JafHRC/bObpHweJ+8RNVZDlCtJz6jJbsrx/2BAiuotsdrlED
         8L4P9zpJPvadD3NrJfeQa1GelcShHkaS0HNLncz07jbQ9uwEGBsusXdqlZtV+PhC+hnK
         hI8w==
X-Forwarded-Encrypted: i=1; AHgh+RqZkMRiwbKneOTFgIxNOCKVrLpooDC9H5Rda9WYRd2LxAFBz5he2CsneVxq6Mdr3oVxE7c0kvWg7Pg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83c+3vrBYXf/WvwK0D4stpAmd/rokX+Kdlm4ZuV3w0zxUhHIT
	08oBLO5Zgvu7GaMsdKUQgqPq1A11JxI3UeBwlqLrzwSn25HkR0rJbjM+Pj8Lwg==
X-Gm-Gg: AR+sD12DYLvoEb5OHHHuTLk0P9Yge0vQJAd/HB5DJVgARiwQW+8zjwe45gcvLI44ZK1
	rrzqeN5CMFfkrkdvyKkBmnzHMHS9ztLT1xd5FNmjNsDdkVFCPNjYAlTx/Igt0BEoqGRdyb3E5Om
	4hmswAr0QAEN8uX7oir9E7C0oVycn/7D3tPjF+Ms7KfkMdwuaFtRbimKWLSqxmOfeeOdZfY6a+H
	dJbt730P26ErCq2YyZlrsu97kRAwn4ZJxMMuvJrgfI3pSSzvyZAndARQnHn20GCQLjRzI6Ae4Vt
	X5i+/tSvX/VlogHuqbzlNV4NSQe/FyfTaSiI5U0S8ow64Z4z2p3ZXewETrSpN2FaO0Z5qoOReF7
	Sfr06uqtaYY4UNyjx/9Z/aBKgnlb2dCogsckur6ArO5O7c4IApRgM6cD5CdtOhZO1RKLxhkVQEH
	Inrd+IoPi4nZJ3EYEyeiZMabP1FwEGOK3HW+G9Xu1jZwWMAYmDx5k=
X-Received: by 2002:a05:6a20:4c8:b0:3c3:8d4c:6673 with SMTP id adf61e73a8af0-3c92a89cb4fmr5298368637.37.1785635345645;
        Sat, 01 Aug 2026 18:49:05 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::4bd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm32112187eec.4.2026.08.01.18.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:49:05 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>,  Paul Eggert
 <eggert@cs.ucla.edu>,  linux-man@vger.kernel.org,  bug-gnulib@gnu.org,
  libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <am6X32HkGdm2xTd7@devuan>
References: <cover.1785532392.git.alx@kernel.org> <3556566.BddDVKsqQX@cagnes>
	<am50AM0bdufHa9W3@devuan> <15288158.RDIVbhacDa@cagnes>
	<am56ZBzNM5J07AUa@devuan>
	<f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
	<am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid>
	<am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com>
	<am6X32HkGdm2xTd7@devuan>
Date: Sat, 01 Aug 2026 18:49:03 -0700
Message-ID: <87cxw1qokw.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alejandro Colomar <alx@kernel.org> writes:

> I'm not innovating if I say that the standards are mostly ignored.
> Actually, I am more in the side of following the standards as much as
> possible and appropriate (but not more) on average.
>
> This is just a case where educating on the current standards is done by
> 1) documenting at the bottom of the manual what the standard says, and
> 2) recommending to ignore it because it's bad.  When the standards are
> bad, this is appropriate course.

But myself and likely many others who have commented on this thread do
not agree that strings.h is a bad name. Or that general memory related
functions, which are used on strings a large portion of the time, need a
separate header.

In one of your original messages you mentioned the following:

> The standard mixes functions for handling strings, functions for
> handling bytes, and other hybrids, all in a single header file:
> <string.h>.
>
> This has historically caused confusion, for example leading to believe
> that strncpy(3) is appropriate to handle strings.

Then, in another you said:

> I find that an acceptable result.  #include's aren't that important.
> When reading code, the section of #include's is unimportant as long as
> it works.

If I concede that "#include's aren't that important", then strncpy still
exists and still looks like a function that should be used on
strings. So, we have still have the same problem unaddressed, right?
People will still use the function and write bugs.

> The manual pages should certainly educate about reality, and standards
> are only secondary to that.

The current reality and standards are fully in alignment here. memcpy et
al. have been defined in string.h since before I was born. Anyone who
knows of memory.h knows that they can just do s/memory/string/ and make
their code look more recent. Anyone who doesn't know about memory.h will
be confused why the man-pages tell them to use a different header than
they have used for decades. New programmers will follow those
instructions and find their code breaks on illumos, when it really
shouldn't.

Collin
