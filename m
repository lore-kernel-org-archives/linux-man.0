Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56D92874E3
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766237; cv=none; b=kfZMWj4DrVla24SZ/gPr5iRxOQbgNbdxrGCns0Zw9Fc78ucq6TzDlv2YVVzw1saXHeLgumffvJ9fFwGnNaVkjg1SXUaWRbGzshClNDtMh/iKlqCUFPz3AZs++Cyzs9P3m2utQKC2lW1p+vt5DnmP9qmljc+ApKvHtH2WDieY3Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766237; c=relaxed/simple;
	bh=MjdlYiV1yO4jqviQ7eX7iiNsQ/CNuWRApZfPyDJu1Pc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gcMOW9C/5pazEKQQ6FNT0E+80jse53aqxdLbMcZwKXGbxumxOpDwW6s1M8JUOiozac9WLYOh0TVm1NFh4A6H2RHVyBjXyNpt/QPCc+iAOgpBTTmJdtZjx2NaDO653EE8cMUIpHbRA9eaTEiW9jLk5sEe9NxDWomFGsA7z7i9WTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DFKpkOaz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nz4eTFH0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFKpkOaz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nz4eTFH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785766234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GB63tT9LSv3tVcdfkgdLNUTftTQHPMyegaYlXI/0tfQ=;
	b=DFKpkOaz8mF7t6S5rfELYnMhw80acFnFzNE5dA+G+K8/THOI97YFMB2l3kV6ClpVafqN5w
	UVVn5qUBuryBq3SsUv2oHzGWU3L1jn/+4mcrQX9c1DSX3pvRO6fbJJAnMV1CVkHM0FeyMq
	rl4jAx02+jlW/p8yHE4UKK5Xnqo/elA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-ya_XVtxUNbCtox6hxcijEg-1; Mon, 03 Aug 2026 10:10:33 -0400
X-MC-Unique: ya_XVtxUNbCtox6hxcijEg-1
X-Mimecast-MFC-AGG-ID: ya_XVtxUNbCtox6hxcijEg_1785766232
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f6d70223dso2664752f8f.1
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785766232; x=1786371032; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB63tT9LSv3tVcdfkgdLNUTftTQHPMyegaYlXI/0tfQ=;
        b=Nz4eTFH0CN63Z3VwFnRqR2YKWNTOPSNBXvShzPBSxYRqy3T6lSEQ0w+vaSzalYB0sl
         2h5mzvaE86G2g+uELuWRX5kaBidC03S773D58gyf56vigNZkh4zo1ahrBXKh1gfkRxyq
         5OXQ4PtNmzm05QHebtl9lxrkWRRLra2cgsBIy49LLoHPWZtOuPMYBDKKg3b0sKfHDZlu
         I4AHh8EEYIpL3Bp8TrJtnaAachXz6QISisXm1SqdKiMwvNLk6ikqtdT6wiRvcGh/P6F4
         9Mu5LHoyO3YD6Y8cazI5K5c3MDrg8lzXnG9UcTthTDjQuJaNexgo3z1JC5y/UUgqktSL
         wWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766232; x=1786371032;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GB63tT9LSv3tVcdfkgdLNUTftTQHPMyegaYlXI/0tfQ=;
        b=F3h3RU5r8Xa38bo8b5qtOmLYJccm00haeUnhgaf0EcATZVbIOltnbBbi68obkB0L9M
         68qVZD9s7YxmpnB4IctnTQ0LyD0Auxcs1F3EwHvN/5kn3rVKwA5y2pmRVl7MyoHCbt1f
         yHK3nYBuHtYGZPuFeYzRs5sK9jcGf7zAkZbIK5RUk6Jp5tz2cCjje/uAS/uH3q6lNGst
         CcBlbwSvnp8BCfplec3qBnLjWOaG+Smi/LKoZ9SKobeDhVnbEf6YAWm+Rn1ITaYCg6f2
         vBqJfEjhLgks85HZPM5QaRjc74gxkUW2gIK9TajHJvtUZT/dYWnFbrhLT+yDnoXdXJOo
         2wCw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1yERt5JDNoXXqKj0JraGv4i+KWLcTLUWhxhGSjZfr4jlfZFyHZsd9iQKi1sojK1zPIY0alBlDvN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpzmxrj/4iNKjooUe3ETusIAy1PwcEtJRzIGk1JTXChroyqKN
	IvfJf0PwqWdeiYU54LFZ3jpIlqNODYZvayc52WiryaHItXEidHZ+78BJBoHvzxCPaLx2EM59bDa
	i54B5vkIkoNXeaNXFmqlVZ8WHUP+pN/EGSVQCKpS34GTTlGD/rlGxLETDO4VBYg==
X-Gm-Gg: AR+sD118XWLqqeqGaEkeMkMeaZhsIi6OkI9MpLfHbEhi6re/e6ESwPKUvpJkhLFJgTl
	S70QnCLNYQK2v7uLQcTU+K7/BbYTl3WioFCutE/I9ccI8ywvB/I2PiUYORPGmtJyO+OnI6mYjw1
	VOtC7id+Z6P4TMvbHVpsHPedetunBnYBB+6y/Vo14J1OC6oauGJ7XV8kdD8JIihKOV6fndQBzKl
	9puCGdwaQvo3j3nuBA7iT5hgX1Il5S1Me7pNi0lFZgQJtx+KHSNq0mMKU4FArllc2ej2ULfgMHl
	yJjk3a/NScWE8Ob8N19hixYztq+YYhKm+gjWDdB5W5qzezJdiwfOG/DdyOQ+Dlhs13JahKGfG3X
	6PC72qaZ9PO8BlhSkx9c+NXR+DcIY9a8=
X-Received: by 2002:a05:600c:3b99:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4980c66d8b0mr239579735e9.4.1785766232095;
        Mon, 03 Aug 2026 07:10:32 -0700 (PDT)
X-Received: by 2002:a05:600c:3b99:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4980c66d8b0mr239579115e9.4.1785766231789;
        Mon, 03 Aug 2026 07:10:31 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm34530437f8f.0.2026.08.03.07.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:10:31 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wqtN8-00000000sOv-10yA;
	Mon, 03 Aug 2026 14:10:30 +0000
Date: Mon, 3 Aug 2026 14:10:30 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
    Keith Bostic <keith@bostic.com>, Sam James <sam@gentoo.org>, 
    linux-man@vger.kernel.org, Mark Harris <mark.hsj@gmail.com>, 
    Nevin Liber <nevin@cplusplusguy.com>, 
    JeanHeyd Meneide <phdofthehouse@gmail.com>, 
    Christopher Bazley <chris.bazley.wg14@gmail.com>, 
    "Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
    "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
    Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: proposed revision to memory.h(3head) (was: on the irresponsibility
 of pursuing C language reform)
In-Reply-To: <am6HTtAMkEEkWjfl@devuan>
Message-ID: <cb916665-73fc-bca9-0e34-ea66552fe945@redhat.com>
References: <87a4r6es6k.fsf@gentoo.org> <am3XeGZyi1Pvr77-@devuan> <87y0epdhxp.fsf@gentoo.org> <am4GT1OkqNZD9FF9@devuan> <87zez5bz49.fsf@gentoo.org> <am4jxBOh_VRvhCQw@devuan> <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com> <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan> <20260801235332.vc443gozbqkqdqm5@illithid> <am6HTtAMkEEkWjfl@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 2 Aug 2026, Alejandro Colomar wrote:

> I don't know of any copy of SVID Issue 1.

I have a printed copy.  It has <memory.h> on pages 208 and 209, with 
FUTURE DIRECTIONS saying "The declarations in <memory.h> will be moved to 
<string.h>.".  (Likewise in XPG1.)

> I'd be curious to see whether XPG Issue 3 still kept <memory.h> (but
> I suspect it won't, since it derives from POSIX.1-1988).

Page 642 of volume 2 lists it as WITHDRAWN, "The declarations in 
<memory.h> have been moved to <string.h>.".

So there you have explicit statements showing an intentional, planned 
move.

-- 
Joseph S. Myers
josmyers@redhat.com

