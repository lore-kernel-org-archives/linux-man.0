Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A01379C57
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535821; cv=none; b=Y29D/Y5RPvIDAq6E0ka4kc5Nl+c1IJ8w7ZkdYrZx90tmTUy7iXx9JxBiCg8qHlfRPBy82oJnNcyL/m2Cd1axPdKdYXbyfQgRopIy0kddgc2fJXYiHJ/AHz2FIZUR8PkuHoZ0/ympGxU5haqxjcWkXBwGqICv8IR1Zn8rBU7JK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535821; c=relaxed/simple;
	bh=TgBpEGqhfchQep34BeWxD46PQ2vd1ini4n1AZszLlgw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L9GIgg9/wHPg7gl6+0qc6lnbB9DHpJSrE3nvQXjRFEqpiAo11Gv7QeGeQKhvJ7n+V9oaQUDNMhXIbvVCoOi6YaHHkyafxNSXdVTgMCBFx8hzo+pHwkJw/71H9GJIQhXdKHagSGIal/FdQk4EHPHwUNwYLfGc7J2/KvEw6OilIZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fle6SK/G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUztFoRm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fle6SK/G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUztFoRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785535818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a1XcyeigWqICD0F6NmZYkVUvK3F7UVc7pmeSq3p5ix4=;
	b=Fle6SK/GkaqwDvgdPbAysBC6jajzzejQlqdIzqZWUL/93hfzu12pMcEucnUXySzTGlPvBB
	pfqQ9ym6RQ4Pd2iFCIoNAaZXCgCshcKTDXwbMxN2BctV/BDIGEXIhlHHqUTLHYz/Kdi533
	jF1ucDakMw9Cl9ig41b2fnRuzUPs4d8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-asGnyTE8OKmt1HjeBmTpGg-1; Fri, 31 Jul 2026 18:10:16 -0400
X-MC-Unique: asGnyTE8OKmt1HjeBmTpGg-1
X-Mimecast-MFC-AGG-ID: asGnyTE8OKmt1HjeBmTpGg_1785535816
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15e57a7f8cso148907666b.1
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785535816; x=1786140616; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1XcyeigWqICD0F6NmZYkVUvK3F7UVc7pmeSq3p5ix4=;
        b=eUztFoRmxhj7oZxv9cS8d0hbTHckFS6zdOaGrcovH13GOSWgKssDXk1U/JhZDvgcUi
         J3uHbtTLI2NRrgKQEBSAkJhuCZbekHwh1es4VpULaYWppPQzDRmKMiGhFCH6OCX85nBP
         XYjUNOAUpHHLFA4Yog7cFh4uJ2+/RfJfhuAJz4zyicDRKrsXyryK1eR191+lvMZgLpn1
         t1AsyV/7EJeJ6hBPHJ91zkFC97pcqvXWanm0WWreRhRerVwSmSxuJ71BEkfiJ2x4GEcX
         p2It1MHnH2iQf/CMD4G9HKPxV/JbiW5tdg4P0TnSFsWAZm6k52mcp6pGUfxVbYiDK2Yi
         isvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785535816; x=1786140616;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1XcyeigWqICD0F6NmZYkVUvK3F7UVc7pmeSq3p5ix4=;
        b=mNhDtFE9tpir7230RWxVpL5DaCys1ecUAHDsM8p//kc68vDU4YskcgWWZNrRdr6SLo
         yBeoffAyO317RQt43m+xDFWnMwWApgjl61Sup5D2ObUj0unN5viUbzJOqu8LUb7OYEnJ
         OzGJMvTABSLZZaCJG9IcYC+Z4+d1oljoGfM8zzjuleoojVD3Fk0Od/BkrInywmuhgS5a
         ERIUn5b6/CALBLslNic2AJDaI7Lxp9P4t/0cqfB2x+2ux0TmSsN99S49CXbId9qQ99E7
         ekRzXja5Yok0VolrXSkK4UNx3qgImdbrglWMlQ9Fk1PFy18bImDUZlvwkbqlAGz4jMgF
         Bcwg==
X-Forwarded-Encrypted: i=1; AHgh+RpdFzohvJ+xx3U5FFILAgmX0YIrEHMi0iA2x8yj62f3LTUSgyklAcvXrGvYDOI+Npt2KM36b3ZgoC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd4EOebEyl/BBNhpWciTSdSJAlI6lgJ1fwRhcv7EtcI0jAKvdz
	NeVUDVGn9wgIWP81pksqVAPXyGry5YXxVsmsGKqU2O6X68zwhGp/mWPWxmp8Ig04EpoJDfCws1y
	bnwOnC6R1HXeXdnwOf5KEnEcSEwEnqJzu9z09dkw3HltVUC/t6mPQZT2Lp3wiYg==
X-Gm-Gg: AR+sD11ZBcAHCR5r4BlrFa7ZMO7Qii6pHaKuJafJZXzheRMdRoepsG4b8oNcHC2nwXV
	gwM8BNdfPe/ULGqdvyUBx2SJh3qv4km6rcD5te6C9slPkyUq8D34vl5JuhRkaTKpIyh1mMqmqzA
	S7bav+PQjrWBYDzx8gV6UXT8N82ijMRWz95vdKdiWv48OX0XsYR7WHq5OCvUXgPsSplGKOhsD+F
	zjwFFsvpbX/ZYhwL5thH01YIOgzlZwu4fyM+dEVBCbG2cFHhwXqxe86x8xP8e1BtWX0vawreAE1
	h25PsFYh4rh4ohzjbmzCcVRGZ2SQFoeBAeH9bIlNCS8xFTefv9kAQRBb8IW7IE6J1fK+v/xOB5o
	Ljicml9dm0BDNmoZrsQcGzcyh3qf29aw=
X-Received: by 2002:a17:906:f5a8:b0:c15:ce72:9347 with SMTP id a640c23a62f3a-c1fe7f975f4mr77719366b.19.1785535815700;
        Fri, 31 Jul 2026 15:10:15 -0700 (PDT)
X-Received: by 2002:a17:906:f5a8:b0:c15:ce72:9347 with SMTP id a640c23a62f3a-c1fe7f975f4mr77717266b.19.1785535815261;
        Fri, 31 Jul 2026 15:10:15 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3cc331fsm293186866b.28.2026.07.31.15.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 15:10:14 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wpvQj-00000003I1Q-3fpp;
	Fri, 31 Jul 2026 22:10:13 +0000
Date: Fri, 31 Jul 2026 22:10:13 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
    Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
    Nevin Liber <nevin@cplusplusguy.com>, 
    JeanHeyd Meneide <phdofthehouse@gmail.com>, 
    Christopher Bazley <chris.bazley.wg14@gmail.com>, 
    "Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
    "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
    Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
In-Reply-To: <20260731215122.4p4aepsbgeoibx74@illithid>
Message-ID: <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org> <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <20260731215122.4p4aepsbgeoibx74@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Jul 2026, G. Branden Robinson wrote:

> More to the point: what's a better forum for pursuing this attempt at
> reform that will both (a) reach a significant population of stakeholders
> who can variously red-team it and/or endorse it; and (b) has sufficient
> visibility that it can't easily be ignored by people who oppose reform
> in this area for whatever reason?

man-pages should document the world of C APIs as it is, in a way that has 
broad community agreement; it should follow, not lead, on any changes.

When an API has been in <string.h> since 1989, that means documenting 
<string.h> as the main location for that API - not some other location one 
person thinks is better and that most of the community has never heard of.

Of course, where there is broad agreement on a deficiency in a particular 
API, it's entirely appropriate for man-pages to document it (for example, 
to warn against certain naive uses of strncpy or strncat and make clear 
the very specific use case those functions are intended for - but not to 
promote one person's idea of alternative names for those functions).

-- 
Joseph S. Myers
josmyers@redhat.com

