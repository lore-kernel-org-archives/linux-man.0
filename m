Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7051D26D4C3
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 13:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764565; cv=none; b=dt4ugH9AOUcQgpJ12j0INVnGn/0FMHm/V5YvPho/rtm3uneEF4GG0AyGzAmmaNvfcbAtWmq6GkFiVmOxxh1H3MvZTfJ9cv3n0A5MP1nJCDpNnZGKl+L0JSxLtROriUIItVbtR7npxobeew3rkJn7UgZ+IsiCIEg4S7Bmtkv4Jko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764565; c=relaxed/simple;
	bh=B6AAtP6xknpSMAOkaeZaovsHRxEJqRs4VizU78CG610=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Vt1RC1CZdHoCyfrEzGjWATSYisDsJjB/M9qYvyZ1iF2INfyZM5XICP4wZKI+g2qc0m0LjJ8feUAd8xm4g3O0b9OsQUwlgiOkiIh/Y+e/YFx4K56uct7TcbLh/xmBZQJkNb8jThLihYgv529E62hCpm7hdWE/b81k1YI9sbWwSEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HIS+Sjll; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rtIi/du3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HIS+Sjll";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rtIi/du3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785764563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EKSh7yMVyAiLhlQWvyGHqKy1D/x6K7tqYXxKDDwHbhY=;
	b=HIS+SjllqnmNeuxNVXPN4jdV3YNELMK3uuwH8B+6sG3som+gDzACtCHKLoq6zt7JDB1RUF
	rT1Wd2T0RO8WVlxZd/pbYwWc/yogJkdiINidKX/RM7Pd215F6osF6BZpHyPKvaZwC8t+1+
	bNeXoxVCvEg7VPSv8XLzNB95GhHHGRA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-sH94mVMrM32TwpxjiD9ziQ-1; Mon, 03 Aug 2026 09:42:35 -0400
X-MC-Unique: sH94mVMrM32TwpxjiD9ziQ-1
X-Mimecast-MFC-AGG-ID: sH94mVMrM32TwpxjiD9ziQ_1785764554
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49561facb1dso14424085e9.3
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 06:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785764554; x=1786369354; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKSh7yMVyAiLhlQWvyGHqKy1D/x6K7tqYXxKDDwHbhY=;
        b=rtIi/du36yOyq7w44LXPlaclMVRJ/6+saCjppltXRZrv1pKNV3pvrqkwYdM4KjsK+4
         vf3FLpbdFWHaUm/hZ1ncOlPM+3E9u4Py44teAgJbI6L9iNHaFkGdmo3gHomZ1dvevLnq
         3+F9KjMs/X6Icdxy1p33hUOYE2KgC1jVhXzWeXRBIPVbpHossRcL5GTX7B2wI+pvFwdu
         KWwAOnqaLnzJBKLXDCDVQybStrK9XK+4/Ewyib4snQkj/6ZYMH7TRcveDRe3sS4THwuv
         Vs1eCCGu35cut7d+5BAjnVw+CPHsjnyjq32+QxeIJiAA118HtT41C0MYwE9GFifczAaz
         KKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764554; x=1786369354;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKSh7yMVyAiLhlQWvyGHqKy1D/x6K7tqYXxKDDwHbhY=;
        b=doG/5MxcrpxPraJMVQwCQFT/EB7ARyU0toi+dHujbaN2o4mtqWcC8BvAH1aVDA9VR3
         UFCpniYKA/UJyqy2U2mH8C0pQ13XF/1MCp7p3nbfIeGE9/swxnIKFqm0LUMEU7L4hXwR
         GMWt6mGtY+Q7kqo0NI9j5kIhf+AAV69iBWIiSSV1LxOgYwp99ij9HH0ydTJqN0iHlDSk
         BXtU+DKxwtY+rCnWzqZMTiRRG8b7VY+jQW38+f1/S7X24sthNAZHJqIcdl3NpO3k05lh
         JXuysEJAFRymekdDooCs1HeBhrA+PvaYRPvuE29+LVspBowbcs6dgaYXDFS9mCRT6eYZ
         sKHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRUQearAknHUFboHUrLiEnhJl6QpdyBhxppuCh0oXnmoF6Er+wqoPJsYL/vngibUv4KwdU4451BiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZJlD0938L390VopTj+jCpoJpc5L+vCpvEIa3KwUU0IlaivhH1
	/OR6uWJyDPvmpWCiCmWq6SdScdMLfQzwt0jDcTQlptN3jtkGpNFWj6zV4y/s3bEXOjiJGxNGw59
	KHNOSddWQwu3qgC/RzycSZ7IXXKAzbBcz6irjNZzeQeGsKQsIYQX22mTjj+ldrQ==
X-Gm-Gg: AR+sD13u2bNewxG+MtcascQ3kifdhwEoHtYg6nQlN6WdZDN9jzu9b3dVIIWl+H9dljh
	/Pd5Otii/14xSAsbTuEX6GltSOFrScBbhFkBzwSXXWSli+FTizqd8JwpLUUQNky8L7VTry9iMKD
	TSzVemrRWoiJY2wyKimKOibSbbttXQzBgap3r6zsByy9vXJAPNUW+JlKeKStB5o1dzjbLoyRspo
	LTLHbCJ7SprysJdhKBcDNXXFIWiPQ0XwWM2nx0L9E02p0DUdQdGgIwC8FznJSpQBV1BU97bjNGo
	fvkMdkvDei3X1kMaJ0uON1sS6UZuorCrrCoes93feGMh1g9kZjyqzHSrfsvhDBed4o+zBv/qlQm
	tgRp+8z/hMY7PWS5bqq3DoXUyQYJC9LU=
X-Received: by 2002:a05:600c:3045:b0:495:7a5a:d96c with SMTP id 5b1f17b1804b1-4980c696b4amr141361825e9.18.1785764553916;
        Mon, 03 Aug 2026 06:42:33 -0700 (PDT)
X-Received: by 2002:a05:600c:3045:b0:495:7a5a:d96c with SMTP id 5b1f17b1804b1-4980c696b4amr141361335e9.18.1785764553488;
        Mon, 03 Aug 2026 06:42:33 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0ae0sm34240204f8f.33.2026.08.03.06.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:42:32 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wqsw3-00000000rt7-30fI;
	Mon, 03 Aug 2026 13:42:31 +0000
Date: Mon, 3 Aug 2026 13:42:31 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
    Sam James <sam@gentoo.org>, linux-man@vger.kernel.org, 
    Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
    Nevin Liber <nevin@cplusplusguy.com>, 
    JeanHeyd Meneide <phdofthehouse@gmail.com>, 
    Christopher Bazley <chris.bazley.wg14@gmail.com>, 
    "Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
    "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
    Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
In-Reply-To: <am5oWn8dYoP0r2dw@devuan>
Message-ID: <82eff373-3460-3cff-4ed5-0a04b4fe4fad@redhat.com>
References: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org> <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <20260731215122.4p4aepsbgeoibx74@illithid> <87a4r6es6k.fsf@gentoo.org> <am3XeGZyi1Pvr77-@devuan> <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan> <87zez5bz49.fsf@gentoo.org> <am4jxBOh_VRvhCQw@devuan> <20260801213421.7e3wvyjwmlwxzd55@illithid> <am5oWn8dYoP0r2dw@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 2 Aug 2026, Alejandro Colomar wrote:

> Joseph was concerned that this documentation would conflict with many
> documents saying that <memory.h> is deprecated.  Luckily, I've never
> seen such a document, so we can assume they don't exist (unless people
> show evidence).  I'll dismiss his negative vote, since his technical
> reasons are incorrect.  Also, <memory.h> is undoubtedly more portable 
> than a new <stdmem.h>.

The glibc manual nowhere mentions <memory.h>.  That's pretty clear 
evidence the header is a relic of the days when glibc just took any 
interface some 1980s Unix had rather than trying to have a cleaner API of 
more current relevance.

My main concern, in any case, is that man-pages should describe the world 
as it is, not as you'd like it to be; they should follow, not lead, on any 
proposed changes; they should promote portable coding practices and using 
existing standard interfaces in the absence of broad consensus (not just 
your opinion; not just an opinion based on dismissing all the views 
against) of a clear technical deficiency in those interfaces; that anyone 
advocating for an interface change should avoid using man-pages as part of 
that advocacy, only eventually updating it after the debate has concluded 
once there is consensus on what the conclusion of the debate was but 
ensuring the man-pages don't take any one side of the debate before then.

I suggest we need to figure out how to generate man pages from the glibc 
manual so that people who prefer documentation in that format can have 
documentation of glibc interfaces that's maintained by a proper consensual 
process rather than following one person's opinion.

-- 
Joseph S. Myers
josmyers@redhat.com

