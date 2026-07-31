Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D39A35B632
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785537727; cv=none; b=gzLgikmpXcKlqRC6j7zHKkST6f4X9YbTmA4vWzP17No5XWS0rshvSsy0c+X9hrUEXMvUjkd9alBIn+oEw/SZJAXdyN3eS8/qxEdce0WuYSgKulA8g4OcQrCfUppqZ0msSYpRdJo0Y50qJtTI4EGu9uMgwymbsD6pIFs0N2es+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785537727; c=relaxed/simple;
	bh=PcAHNEFn8HmOgH1tNnQlsHxLS8m54D5po1NHBeIjr+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UdB/D/V5ohypQKuDZ8mz5H1j8/bXENSk38WmF+BRZvQBjByMvilZ/+nrPxSysIQ2BlCGG7aJoIqgeoOaMevOBSKLhe7I/3T+zET4TijmfEEn/JJEKAwrc6CmVj667jhMDFIYrj615RCfjP7ilXNQrIupWTU7+IYpfKY34/3Iajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iyc3i9wQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LSuu+RaQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iyc3i9wQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LSuu+RaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785537725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GFRgGZA8lNBGkf8E1h4gHa1H4unlTLYqjur/RFZ3lFc=;
	b=iyc3i9wQTsjGKJ1QBfdR2fC4MYLCDGgAWE/8f46P1sJXNuWwKwjY36DYiTXmuwoBwsYKz+
	7DroTbZO391eoM9rcmzA+cOssCiEwWm4sH7tO5Hxu8Sxun0FnQkiEbg2lsOY/1Jbgb0EOQ
	UiM/GwtDY6/zNXWkGDU/+k8bYVNvQv8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Exza2pKQNKm2AkLeLDkx5Q-1; Fri, 31 Jul 2026 18:42:03 -0400
X-MC-Unique: Exza2pKQNKm2AkLeLDkx5Q-1
X-Mimecast-MFC-AGG-ID: Exza2pKQNKm2AkLeLDkx5Q_1785537722
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f7039fa59so1505131f8f.1
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 15:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785537722; x=1786142522; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFRgGZA8lNBGkf8E1h4gHa1H4unlTLYqjur/RFZ3lFc=;
        b=LSuu+RaQNCCKemMOv5OsHEaQxmNYY/On+ABpDDrACALr6nFQHukpO2y3uyZcwWfXs9
         4aHlEHJXgCUQ1qf5FrAU8QD+8tCfr7+zpcaXQ0GsT5wHZPK6PtPBgTJwF3JTmHjfxL+C
         9ff6v2bQjnBpvrNf7cAy5j+Hi2q2/kjQD4y0dsdT+EFBcGxqI97Hk9CUqMspNFks4v4x
         /iiCyiVMea/1eEEiuGD6KmJs/WejNAOhR3Yh5nHLKyCoO1rrpmgBdtULoYU4Dovpp+jm
         OROV1eL7FNXWUrHmj4rXBk5BQWkt0rUQiRSFMYOEN/fciKWKIqWH+VisLBUwJrj3pYkB
         MEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785537722; x=1786142522;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFRgGZA8lNBGkf8E1h4gHa1H4unlTLYqjur/RFZ3lFc=;
        b=N5eIyb68oP1AnDwP0zrbBvi/YrNSTrILYjsxA+EbtVKS99PF/5mwLvpDT2irL/UAWq
         neux6Clud+1PCtzvHqJ2GIwlbe8rC8LG+Me7uyD8GRU3JaI8QnUBNoZpRJdOIL54lXR9
         GtBmxHPam7imTTHXHHi/zTV+5aL5kQIBxcLZWvc2nB4oNrQsDMM8NsXKzjjptALKAOOo
         UgVxQm8GNz1kNfK4Kz7VcCcBaV79+cj939yjAUbkXD0ygX/T4Hw1YJROBG6qCQT+QFRN
         5rxbHRst6SVkIcG1vj4IMV3dv0I5SqMUzyl696JgtuWLujjNGMAc+hQdtbxS+vJVDugR
         F3GQ==
X-Forwarded-Encrypted: i=1; AHgh+RobOgPvQoDf0cN4MmZm0CCQy8YOAHZEVy6M1H8FKkrZYeN3fUlrvsrIM57JmEGcwbjmIEyKUTFC4vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfxLczfKadQThHvItwX5X5VDk2+Tr8pT5SG2y+77CAAzePqoul
	j2VwIuRoD650UZBgQ1gDEPN5uAE3KhSC4HRRJkqiivbGiQ/XPlPw1Ag/Y+/sdS30b8ZVdSaEaLZ
	GqgMXG5nZHSlTtaGhKSXYLqYjGyRXPEAO90EIn62tBr7IYmo6Z92cwnQTSvz/Ig==
X-Gm-Gg: AR+sD126FmZC1bHswN12CBN2vcJjJNaveNK6wBtJnqswXn4KSDJ9PxFzRr95Ktpu0y6
	ofCcDMnkdbm1NMCd3TbHJDPRkJXfTiewq/thDHrCuDsQAxmN2jzV9nDc5vu/4akKZKU+htvlxJS
	EiEjd4KOdE2sACIjUpVtv2GsZys8+jmLPhOAQrVUiHR4zJmdVrwDuaYrnzo7h+NHpxgH9ecn3gL
	lTcv6XhKyEvSBuapUum63ExBtLEk1HsOq/YgdgMwFxu39/+5pslM6J1GZkPxRBp5wVyNWw6GRfF
	bmWPrApuoZKvmlcfs+J8enUFIWA7O6evkOZKFW9AYBdvXpbMyq6+GnaDErjJDzYkNql+Po+6kMr
	27OB9SkmHMw8K7m57mFvVy7FslWCqWrQ=
X-Received: by 2002:a05:600c:c1c8:10b0:493:b243:8ffc with SMTP id 5b1f17b1804b1-4980c68e3e1mr163935e9.35.1785537722479;
        Fri, 31 Jul 2026 15:42:02 -0700 (PDT)
X-Received: by 2002:a05:600c:c1c8:10b0:493:b243:8ffc with SMTP id 5b1f17b1804b1-4980c68e3e1mr163765e9.35.1785537722196;
        Fri, 31 Jul 2026 15:42:02 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bb4esm10709794f8f.30.2026.07.31.15.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 15:42:01 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wpvvU-00000003IYM-3aCH;
	Fri, 31 Jul 2026 22:42:00 +0000
Date: Fri, 31 Jul 2026 22:42:00 +0000 (UTC)
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
In-Reply-To: <am0fnb4BMRrTajqx@devuan>
Message-ID: <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org> <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <20260731215122.4p4aepsbgeoibx74@illithid> <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Aug 2026, Alejandro Colomar wrote:

> > When an API has been in <string.h> since 1989, that means documenting 
> > <string.h> as the main location for that API - not some other location one 
> > person thinks is better and that most of the community has never heard of.
> 
> FWIW, the APIs have been in <memory.h> since 1986 in 4.3BSD, and in
> System V they go back further to 1983.

In other words, they were in that header for 6 years, and it's been 
implicitly obsolescent by virtue of the standard choice for the 37 years 
since then.

Standards involve accepting agreed compromises that might not have been 
your first choice, rather than endlessly relitigating past disputes 
without new evidence or changed circumstances.  In this case, the choice 
of where to put the functions in C89 was an agreed compromise that 
implicitly obsoleted the previous location, and should have put an end to 
any arguments that <string.h> was a bad location for those functions in 
the absence of clear new evidence.  We have plenty of clear evidence for 
confusion about strn*; we don't about mem*.

-- 
Joseph S. Myers
josmyers@redhat.com

