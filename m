Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709B11799F
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785536181; cv=none; b=lez9z1KDBAiXwTOoMW2sTkAxdrzTJH1BBZggG+JL/cORy6tj/a+W+EMDzFYl40uKk9p/HlYo9ceXQA+YfY+NjYc3sWOgHHfNtYMK7LYFYNVBUGv34yX8yM42vCMO1LjlmU17QKrfffJKv+O06CUuIyanSb+L/13kx8vz2UUruO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785536181; c=relaxed/simple;
	bh=IXCJUJT53dw+Wk6H1pncUUqvO1OD9OIO84kTNDxRa/g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J4xPSCiaAwcXMqHM+AZUDfE0ikAEszG4i0a94ACkNXyDIP8br+s4lcWF6MgthkmpGxLbaZUV7cxjGnneoMybKDfuCcr49Ig9TCd2gk8NiqRPVP19mpi9iBFxTnsrrDpQgpcNqKFsiPUg1DABVws91Fd7oA7A8ECywuYmvWbXjJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=elsuU33w; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sQ9rJ0Id; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="elsuU33w";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sQ9rJ0Id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785536179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k0yg7ea+KJ1RsqNF6vdg+y7nWN2AmH26+RS8cpsMIlU=;
	b=elsuU33wyhFofHrVVuxlCjRforgejHHtEHkshws9+1k/PzZG5RC+7hgbzEQ8ahn7DrDmqv
	tu8FWK9DUzVNRv3XfZNXEbvA5h0kyJvnwmwS2xCtDi99iwSvdnFxJuaG/8ROMdLHjVDBgI
	AWq8Jjgs/j/utj6EY3ZQAmeRqI7bd8c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-mg8TMWymMkCWpUXgICtr_w-1; Fri, 31 Jul 2026 18:16:17 -0400
X-MC-Unique: mg8TMWymMkCWpUXgICtr_w-1
X-Mimecast-MFC-AGG-ID: mg8TMWymMkCWpUXgICtr_w_1785536177
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15fff01a30so110400966b.1
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785536177; x=1786140977; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0yg7ea+KJ1RsqNF6vdg+y7nWN2AmH26+RS8cpsMIlU=;
        b=sQ9rJ0Idy533RY5jDnO90G+KC4GtC1YGZIwklM819DC5U/Am1nBRV2RT8BQhVTuEEf
         96jaQLpItGKT59vksYVXKChj/C9gUoCweohNIyaqCLE3UBYFQC7a0wl80UnMxz3kobDU
         AdenIdcUtAnJfog2CfJx+IjJMDXGrDqLN2oCt4dX4pIBf9DezSmUsKdMru8VwicMmpwF
         0/zdtkW4AyzBBnLfpuwq/htHp3TxIF4XET3vRYoSHO0MParoN1hGRmiV1WfMKCdf78wc
         t/6e096V1iHuj+GcN7eRAurIS8gXtOHQuCDstSPsuruDIaVIqWVj8XJ1HXJwOmXnmmF6
         INyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785536177; x=1786140977;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0yg7ea+KJ1RsqNF6vdg+y7nWN2AmH26+RS8cpsMIlU=;
        b=HHljrQwtCFopfe8ashxbDaqf3CE/L9a+WypDrD9G4Oz439jrfeS/Lb1xDZyo/AAmNo
         NiX+drtoQtQg5TT1qsoWnBaVglPFK3oS3qjb/Y0GIJbOZrnMrZCEj+sxrXFE75fDdEpl
         Z4blyGi1bhBfNwxdF0EjnXXafBc/i2SxFDzCOCCG2GUQ3LZTIAqmwGZXR8oNPzr2Qv9H
         kQAecnhENHIGBHACWnvLrDHiZtsRi1N4cQd2JYpUybsudzP+adID47HQwf6O/BZxasv/
         GsZdNXmMczqQWo9Ph06apwQDFvQ3/7AfCFvAk8tAm7E2jooaV3uTRHshDANbO13pao0I
         kEvQ==
X-Gm-Message-State: AOJu0YwRZJUg/Zmpd3WBWi1ZyD4Up456jlnBUK/atyh7851lqEbqJr+T
	0gbm6loxTLBKJSnY6KgLf7cROjM1Sp0PEVeppaRI9YnmzlFhtoYsujGCdg/NJLhnuDosM5wKYmh
	1Z1AxqLA5Y9TB7ZT89P5UjhMJBpsqbUgd1Ay9l9MwVUZXFI6oQRDcUGBVXHVu1w==
X-Gm-Gg: AR+sD12+LNYa6Eg4shONbPqdyz2Yks2I8a/mvhVAd2HFyElddiOaFb3sT61PO8c3fFS
	3vyLnmIVF0+ep+MZbbpDDV00KtBpnsLhq8QZoIczoH5IlJzBDhVv2ZMW16QA9PqXabWJnfGXjJl
	+YtkBe1PVQ9F7KWu2Zwdx8rKR2GckYc+Qth9F76/SsSzJgL8OA2wESAEFauYqSmLD3nHpWnMQnB
	yQdisvQ00OeMde/Uzn21l/fkEBaMPIoE0TTSegnJBNh7eDjdKcGylokobjLZdJ483Z9hUid/+01
	ZAy22VgDtYTYLtzZaRbaCBfVOLlZrr8E2UqkuOqGpAKzOCZNFWU03IA6kamuYh+dndnNL8pBxws
	wJF0BGMiEpBZXx5lbeVeYd+G49gOwH2c=
X-Received: by 2002:a17:906:bc87:b0:c16:589d:c965 with SMTP id a640c23a62f3a-c1fe81806a8mr50520966b.46.1785536176775;
        Fri, 31 Jul 2026 15:16:16 -0700 (PDT)
X-Received: by 2002:a17:906:bc87:b0:c16:589d:c965 with SMTP id a640c23a62f3a-c1fe81806a8mr50520066b.46.1785536176382;
        Fri, 31 Jul 2026 15:16:16 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd450d71bsm248851466b.46.2026.07.31.15.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 15:16:15 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wpvWY-00000003I4X-3Vi1;
	Fri, 31 Jul 2026 22:16:14 +0000
Date: Fri, 31 Jul 2026 22:16:14 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
cc: linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
    Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
    JeanHeyd Meneide <phdofthehouse@gmail.com>, 
    Christopher Bazley <chris.bazley.wg14@gmail.com>, 
    "Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
    "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
    Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document
 these as provided by <memory.h>
In-Reply-To: <am0ax4Oe6--0Deco@devuan>
Message-ID: <5cfbb530-6abc-9fb9-7df0-0b5a6c942325@redhat.com>
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org> <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <am0ax4Oe6--0Deco@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Aug 2026, Alejandro Colomar wrote:

> That's 37 years.  During these 37 years we have gathered a lot of
> experience and data about this.  And the conclusion is that it was
> a huge mistake.  Programmers have struggled to understand this, and

No, there's no such conclusion.  Two functions, strncpy and strncat, are 
with hindsight confusing (but it's the names and semantics rather than the 
header that are confusing).  I don't think there's any kind of community 
consensus at all that there's any problem with mem* being in <string.h>, 
or any functions other than those two.

The committee writing C89 had to come up with a compromise between 
functions such as memcpy and strchr and functions such as bcopy and index.  
They chose to adopt memcpy and strchr, and chose to put them in 
<string.h>, and there's no evidence since then to suggest a problem with 
either choice.

-- 
Joseph S. Myers
josmyers@redhat.com

