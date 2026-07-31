Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383C337F00A
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785533022; cv=none; b=eZAnebfVci4osg6jvS8JirRCtJ7FBthWNdrtdxIsXgggyXd4QjUI7duVXDACfjCyHbikmgoPTuCrBD5r5XguFcN4moFxYctqarc4dUZsMxH1ndbMWF/DE7GCbcEaCm8LguzSEmwaTHZa3OircZwJ02cVh2BjIxjTfDAtrqHV97E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785533022; c=relaxed/simple;
	bh=EnN9nOlWKnyfTH7nsVVdvhjuC9LSYaTqKJ5csqu4lFs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QDMczV9bwdI+Vw635fBem9p3kkqLxcJVmz5A6m7rFlh3wmVXZp/FoRJWGdJFUjqYtuu1XPgeQ53AKq59mE6F1fTIEliXZUk1zWJsvMXznuTRxmu+7mp7lDqyXGYz/DjBpSuZR+UR7Pdj3/jOPb53Cv4q56j6ik+17F4Yu56peQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d0xigkK/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SfS2PxIh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d0xigkK/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SfS2PxIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785533020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wNTbiWgsXqT0UfKMy298oiM5fKwOftWUpwVVsUvxIuc=;
	b=d0xigkK/wlyeeOAGgWDnQoQWdRkHOMLDdoP9hj/ZoB6ZwkrFqi859yDTl7T5w7adFc/t5t
	W93K0IGdPXmMuAEkxyFxzQU53Uvm9CB5s9esRCPVTqPTXrBGp7ZBU7CgHXA2rtkAmTuaff
	30lxmrnzqn3elQegbQxUlH7XWbLPmzE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-0IN_53X7MPSVrp31itmyPA-1; Fri, 31 Jul 2026 17:23:38 -0400
X-MC-Unique: 0IN_53X7MPSVrp31itmyPA-1
X-Mimecast-MFC-AGG-ID: 0IN_53X7MPSVrp31itmyPA_1785533017
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c15d4224f9dso111749166b.3
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 14:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785533017; x=1786137817; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNTbiWgsXqT0UfKMy298oiM5fKwOftWUpwVVsUvxIuc=;
        b=SfS2PxIhV12okZzC6pFc+tlCDZMxS9ZkQNekH6CyYIF1wX2i7mW0Dpwdr7Hr6srv28
         +RWK5LMxGR3clh/rLECc2wg3k1tm4+d/tluoH3OpJpfmwHU02x/56nwMTZSBdocQId6U
         9MQEwU70xJUOvmHU/ZjD2Lo09dHOm0fB2j+l7qVV8jD3zLTjsm/TG7wSyV4YEZajEH4y
         JysqDSM+Hczyh+Dggk7JiaxwdE7A0550YB6hMtMRCKKxEE+/zHN17endcoOq7/lO/HWw
         e+clFdMrE3BW/2Zrf/l7jfsas6FkHCI+EHC50N8G/h1ZTunT0a8A2NODWOnczOeOVfvr
         0Mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785533017; x=1786137817;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNTbiWgsXqT0UfKMy298oiM5fKwOftWUpwVVsUvxIuc=;
        b=liMa6b2xPAIVcRv77ciDkcYsei/o1tkYq4J6NqMm4Mi+IV7FH6RxVCXQxqO85w3Jss
         GG51EAtExwEepalmftFIsy2zvjZMHMOXmy+8NLlW2w1zCgIsdwX3EAeORntF7Lv41eeq
         I8WuqoMeZ43lNONu3yFyjEBCCkF05thL1R+AoOTYYR5ZBtfxuMXG5DpeV0hogkMt0tml
         nyz3lDBKPJYn7B/ZoqkicqZEAZ/VYXS83K/yBfbvF234rSdlc4zJlHMiONeRO/aLjPko
         yxPNT8c2LqYY3U36dIZcNwtkDyE9Kwgcz/tW84PVzBcsfMiHGl7nS3D8Fgay7MtH5erW
         GJ1A==
X-Gm-Message-State: AOJu0YwJo/crcb8wmMHNZJwHn5lH61PDSPi1moqmMdv+UDOsJSODRwnN
	QfPdTVpVgWLyYOnAWrOOUl543zfFDmyZoi7tqQf4GKmcFAJuhihVtSXhOSGMCJZZIGbquNMR71v
	kFiFT4nojezQlkZkgNJNCyef531uE/Hwo2arL+m1NuVj/MlI2TpqkwMzPzp6v9A==
X-Gm-Gg: AR+sD116K80aKxoJsAQU1ewXRF8hev4G1QtUYTgeKZyGg5Hvjx1DFoSWTcHQH8/DZzq
	BMGm6Iz9laX8g0PUDy/TsomAMLW1p0iWvIAuTMovqYIkxbpgAYPfF8EuN3bGLQHCRBJNuI+nM4F
	4KzVXk84RO2yIM8pFBpUdCf1vxge17FYcy93QAopjvJ5kse3Ogh6aHf8txnQTkJAaiRTEprD2A+
	AKpT0BpICb1TC6sgIZP0OSkFg4x+VNXl6l7/jvLZDNvhiWuB/w7RVlt/jZDJvrfgIixTMrHKkBL
	EX3O95OYZxRQqtDW7e5cEGbctAqJVj1uR9qqh3XRGXzecol1GpiuTCTObhB7xKWZt7a/j5bvjt3
	Dp2OrPS5U16Fp7myNz2Lk0MrOG170s0Q=
X-Received: by 2002:a17:907:c05:b0:c16:6669:a4fd with SMTP id a640c23a62f3a-c1fe8103ebcmr62635166b.16.1785533017303;
        Fri, 31 Jul 2026 14:23:37 -0700 (PDT)
X-Received: by 2002:a17:907:c05:b0:c16:6669:a4fd with SMTP id a640c23a62f3a-c1fe8103ebcmr62633866b.16.1785533016867;
        Fri, 31 Jul 2026 14:23:36 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5ae4csm253810766b.1.2026.07.31.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:23:36 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wpuhb-00000003Hb0-0vJX;
	Fri, 31 Jul 2026 21:23:35 +0000
Date: Fri, 31 Jul 2026 21:23:35 +0000 (UTC)
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
In-Reply-To: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
Message-ID: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I think it's irresponsible to use the man-pages project to promote 
personal idiosyncratic ideas like this in preference to what's been the 
standard location of functions since 1989.

I'd rather we add a mandatory deprecation warning to memory.h in glibc.

-- 
Joseph S. Myers
josmyers@redhat.com

