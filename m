Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A0C3B6C16
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763445; cv=none; b=fAfA0Pjnp1nGB5lawGQ7BgTNu3vas31h6jHA3g5ev30FyPzCQvscqXRWKsubNoVmtDaP7s6TYBIlloJve11xrxUtH2hf7Zolh1VJDlqoBuFeghcu9VMOY57hXgxovFILGeJqXBov7oiqejMWElSV4s95A+tK+xecxC3fSMADCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763445; c=relaxed/simple;
	bh=LC5T8hdegZ7oCpd/IghsI4xWvvRoCf7xusjLDRE6jRc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MjaA1MetfLaCxSnbdzc1MmbJi0e3Mr0f0JqU/J1ibkUOS8UoyEEoNL2rTRzmX9Ejji6BP9s05RyK9KdFu6EgbodryW1DTGBcWOND8XAGvhVZY8SNP1BpUpa+k6h1Vo9YF8Fp4NQcwR2U51ANxETXPqc0J1lGB96GugvNmAXze1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S54/sqxt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iUzoYkMm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S54/sqxt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iUzoYkMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785763431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2+T7i56uQMh/3Wh1RJwLPBQyZKey8gGSepCbV2SKMY=;
	b=S54/sqxt2w0VZKoOQN9rQjG3Ju17ztayRpjycJKa4XqbolcJZhXMLHQQW23GaHcT1jAARP
	wHJ5yWci/cq0Ul75awskqBhMRPYX8ACE/pCnNcDpFZc5z30ae7MIcrBCiRuc+nDWL8BnVy
	Vn2lP6LrxC0qnzfzypa38Zsyi7da4ao=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-Ns96HBJwP2ON6mIzdLXlGw-1; Mon, 03 Aug 2026 09:23:50 -0400
X-MC-Unique: Ns96HBJwP2ON6mIzdLXlGw-1
X-Mimecast-MFC-AGG-ID: Ns96HBJwP2ON6mIzdLXlGw_1785763429
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c15deb3377eso261201766b.3
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785763429; x=1786368229; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2+T7i56uQMh/3Wh1RJwLPBQyZKey8gGSepCbV2SKMY=;
        b=iUzoYkMmjRM5DGcO1ASTdwW3Qw9WrlQTiKbArdtnrBDgOT/eN2y4oSysRs+xCmDLoF
         14jNTod9EeLjQg/7wTdOjonT++aR+9wPTWZ7mG1vPAqjQwQCrJpQ5q5gcDmuFNeY5V8y
         EeiGTtS+IKBgaEZBtqaYZ0y4lbrGjgT5GNamqV+PPSLmQwHpt+40sBp9IUSCxEHH/YrU
         lJ5pjJr4F4pYl8xx+4ZHchGtF4ARZbKDzrmSqzFjShdgjCKgiSZgssV0psM/k6/UAL3H
         F3PccniB+asd0OhUtVLd4JX4inDBkni+J/GxuLASast6MfPbvA7qYfRUlYxHnEwOIS8/
         bGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785763429; x=1786368229;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2+T7i56uQMh/3Wh1RJwLPBQyZKey8gGSepCbV2SKMY=;
        b=OFnFg9Mz5K3ggcz5DkNd7clUQbo0dCDVsXzgRQoL2ebh8flbH8O8vQzGp6MeaJwd1o
         YH8qwzTEg8HsYl/nc9C6ayACCpaGVg5Vsh2XQaRo7t451WNddpKpw5Ird0yemGfKXZxp
         N259BuOFP5h7IG1wHzZ6ZAOecdjs38wXAlu38LxjVNeJHHdKv1Q8AFXWMr2BKBPu3Tkm
         ktnPcuYgghC6BB+yAy3TYnWn8AXTg178JZwlEdQrKo4JUQVc1j3i0MU1ZJvrS5Yw/oio
         Ts6L4OJVwK+2Qc4IDCwsOiC7c5QusNVuD9X+KsJVX60D3E4bn5q0hSj9zlxWJHx+/Epr
         WXlw==
X-Forwarded-Encrypted: i=1; AHgh+RqC3IfRPadPszXG0hiQ2zgyXOt5U8YEifC/i+izwb0bNr6wLU5DKYW8QGxS139YNFVmvKup4fW52XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgYEQ/HTd40G2ch66yIVe1xvwYZrbI7hiYfJcNFIOEOKSUyjdY
	WomPh5OPB0OnZGDbLBTBg6PhwuSy02ADS9VTTDf42GTkl3FVOKfv+Qu836pHgnjJGRHtMoySNlp
	nWEbD1A+bHAQ9rr/0qkyqhJspKaoy0183QyuQAbzC3aAA5EmNdBO7NBd+cb7Jbw==
X-Gm-Gg: AR+sD11QKIQdkCIU+kfPHhDhMXrZUwMP/P4aKIIqBwciz0eIn5BJUeVRY0gHrBPnNa6
	IH8EOQxG/ZvAhMUqcRmUoPvWfCwewihCnGZPzcUbns0F9tHZM8WB+UjysZF8lkb8bBYBFMTaxf9
	DJZBOxsLIh22Lk90am5Rv4R9QPYRcIW/CKBw1bm8KNm39vK1SmRRFSXvtB5tJ+4XYQlI/vJC/tj
	9kncOBGmUKalTq6rtCkACEQp2wUptbvy1cb4R5t2x77JLJIYJUQO5CdToDfD1Hyw8O1esa98u3H
	LZubUHqXs6ROJS3bhG/BM65V+W2f2qH1ykWKX3WzbePaB4AWnG9QUfcxTzJvIxqAD+FwF0A/k3h
	0UVjyEbnA/gXoZJ6ZDQs5pbUIkZ5tkYo=
X-Received: by 2002:a17:907:1c22:b0:c15:d4f8:dade with SMTP id a640c23a62f3a-c1fe7eebb0amr871992466b.2.1785763429113;
        Mon, 03 Aug 2026 06:23:49 -0700 (PDT)
X-Received: by 2002:a17:907:1c22:b0:c15:d4f8:dade with SMTP id a640c23a62f3a-c1fe7eebb0amr871988066b.2.1785763428707;
        Mon, 03 Aug 2026 06:23:48 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537761sm554071066b.52.2026.08.03.06.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:23:48 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wqsdu-00000000rfV-3qgI;
	Mon, 03 Aug 2026 13:23:46 +0000
Date: Mon, 3 Aug 2026 13:23:46 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
cc: Sam James <sam@gentoo.org>, 
    "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
    linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
    Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
    JeanHeyd Meneide <phdofthehouse@gmail.com>, 
    Christopher Bazley <chris.bazley.wg14@gmail.com>, 
    "Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
    "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
    Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
In-Reply-To: <am4GT1OkqNZD9FF9@devuan>
Message-ID: <f95d7ce3-0b9a-e295-5736-127841582145@redhat.com>
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org> <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <20260731215122.4p4aepsbgeoibx74@illithid> <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan> <87y0epdhxp.fsf@gentoo.org> <am4GT1OkqNZD9FF9@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Aug 2026, Alejandro Colomar wrote:

> It's certainly a privileged position.  Just like maintainer of GCC, or
> of Clang, or any other core project of most systems.  I acknowledge
> this, and I believe I've acknowledged this before, implicitly and
> explicitly.

Subsystem maintainers in glibc may choose to assume consensus for their 
own changes in that subsystem *in the absence of evidence to the 
contrary*.  If it becomes clear that in fact there is not consensus for 
such a change, they still need to revert it and go through the community 
process to figure out what has consensus instead (or if the community is 
unable to reach consensus, go to a vote of the GNU maintainers for glibc, 
but such a vote should be very rare); being a subsystem maintainer is just 
a shortcut and a signal of recognized expertise in that subsystem, not a 
mechanism to override consensus.

-- 
Joseph S. Myers
josmyers@redhat.com

