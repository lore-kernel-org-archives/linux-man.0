Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260565;
	b=XXNPcb2aOd4fP/1qyy1GGBB4kMN7xQEMzJ08ObhGRcJN5GIsj2X13jcXxZjWFoEnuuAW
	 WYEG484YILlcMf1h6ZH+yTLIP+KGRnCB80mn2vR18AMGoUgFntx76vJCJNY38tkG28bOT
	 lVYBbB4tVVkjZ9Ih86/ax0FWXqmUydwPNeCQDtoaSDV5SWa21o49CIz8MnOSLa5Bk5Ws2
	 lPOo+5jnl8Ehg2jE1/1toa1VgUrmnuwxJi9eKPVWNcbaYg1Cp6Zk3XZMLw8GS4yz2gI3Y
	 rxAEGtfDSaCj7iVhmlXQjDwl1nOULGhW3vtVHGoJ8c31CtLNx4rUkRRmTC2YxH42YSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260565;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7qt7i6PtGTNQKFi9/31I8QyTa1jE1ZkqnSFv7KhMFLg=;
	b=F3MamrYqC1eLvS3X9x07yy9HHG3lZcZEYH9Qp6s4Zp13v7hKUIqDr+CBhc4DJNLwfcYd
	 c92VJjiyIUnUIWCKyjoex6AuN7RQPhM2jvpOiMKAfhkMx83vfBC3dRUZx+SByRKTZcM7A
	 VcJ1OfgrtaJl0ZNxP8pw8U0bU+nAMSjVO+5C4jAGTFeZtUai/8mtIA8GONckPofDuiZio
	 uFu0/sl/Ely35uVXjg1O7HjfaXBX2AmqVhry880zmm1n1Oa/R4Y4Ec66OC1QLmn/OiUcP
	 JhkxH16bkSSRW7GQtRySe2YXz17dH3zyoxR6NWNZBPPrd5Cd9Kq9TJ2Jkkt5MA03PLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="ZqhhU/BL";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eNFpVAS9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48141606A31C
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 21:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48141606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZqhhU/BL;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eNFpVAS9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794260564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7qt7i6PtGTNQKFi9/31I8QyTa1jE1ZkqnSFv7KhMFLg=;
	b=ZqhhU/BLf1gi31+km5w6gQJ2ELOwNt/TCE6l9Pu1JIh1FtznhGLR2HkPOaqqexgYwZgZ3D
	OWGJuYke5px5ABNawrutHr7qXVCUuS1cirsJkEnSEns0UHF9cmP7KVBu1oJcmGGm6h/Q5G
	dgaM+rwgwBHRVv59FJA4PkZZXkiePlc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-fVfwDCygOEeCLxjVXUkUmw-1; Mon, 09 Nov 2026 16:42:42 -0500
X-MC-Unique: fVfwDCygOEeCLxjVXUkUmw-1
X-Mimecast-MFC-AGG-ID: fVfwDCygOEeCLxjVXUkUmw_1794260562
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e98b67c0fso27507826d6.3
        for <linux-man@vger.kernel.org>; Mon, 09 Nov 2026 13:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794260562; x=1794865362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7qt7i6PtGTNQKFi9/31I8QyTa1jE1ZkqnSFv7KhMFLg=;
        b=eNFpVAS9cS6bzw97vh6BAIG3novSNxr/vwSMWAA/2guuydZHxTZ4nNEGHCEqvrV7el
         kp6bJLh8SmlkDeBaDGYuxs5h5KS0q//1AGPa4HraZYJmx2d4B5Ga2glfN5oOswuRqgWW
         WILB8fl9mlTmqMgghNzTvjvkzxo+RAR01AOuP2wra0HCbQcBFWAkX+Dd4S7Kvve1IPM+
         R9Rgdmkrd7PCyOQ9Ms8B9sNsvWeYBQM16T3NeJhtYZK9aCqlQ9oAaY/ZjWW0fw6FKyuU
         8g+Z9r1Zg806/YyUzd4TuyR2biWpw9xtxv3vbNzoZxkw8QwVtkV7re9subcoGYmTnhF2
         eBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260562; x=1794865362;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7qt7i6PtGTNQKFi9/31I8QyTa1jE1ZkqnSFv7KhMFLg=;
        b=N3ofxWruMr4fRsl9fCZ/ug9pyOjzWz+xdc9XvGEzVhhEwMKG+hmjnzRd94jeAuqMbR
         CC8zXDX3zB5PxwiKnJ+cfTBXdSFdn1qY++wBNCocwh/vt+agvmEelXC1KHoyevV3QZ7i
         WRAd6XkgsuUqQW5oh245X60YZB21V61BRrPXBxq4deJCFCGOKNwUVzDvncO5UlYVbMfq
         WIdfVHQR5vuhQ99KedxbIbXTmWGh3VfC+cJz527eHTyQkCerQ1RwXsql3mJlKmF2byWQ
         f8OGAUoB33PTIwPde6YZ+8O9JHK33a6RJy6yM1IOnqp62Cj5zuwWT3tJ+K+D/1cGXyBQ
         QCnA==
X-Forwarded-Encrypted: i=1; AL+hErF589swoGYGecCEcBoDJxU7iKzyBFn1AfUzu3OxGJUp3+vMMWyN/4lMFziiX8prHzWfyx2e2jRu3GU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AZPqWvLe4ITaqPFyDha+OrA/J98Ll9fbtP8TZNvCme9IKycPi
	8tASfLRDwa20W8+9I+u2kQTOonPsMcbZpq9P2ugfxqyWO4SzX98bjoPqY6GvIOkzfYeNzDiQBW0
	KnatAl3s8OgAwi+evbi8m7uxN9hv2i72ve/M1gyJFw1yyAfjszZP53LxJI089xg==
X-Gm-Gg: AYBFou0et4STtkgfSXnAq50h8Fe6S+BB2aLmG8aag47ScH2Hqofb0U9QOZ6QjFkVRkt
	N1HPp5DDyXHlE2sKCtL4d3q8Al8D6/lKzQHMDZxLT/ZhDSGMwLk0HnXG9L5TbyO6Wc5hPzo8i8D
	JCpw96VWX1tgNW4/3ovmgjNzPUQelTju1klzJ3yqDHheq6u3VrC31KNZS3zEUnETpsm/eBPYsT1
	JYGOsMef4mmknfkcDoH4UGA02tqRarDuhXGHT5Ou33FALEDMG9FmPDFJde987uNjhq+r/1kzGCI
	JCFRc/iOKBI9w+3HHWg5gyNbZDwxnK4DRxDewENf30Y5r/g0QSYZ8mQchHeAZObovG/CdRajM4G
	CeMzzJDTNWnrKzNbURsREu4nf50YMxx7xMN7OBSilaN8lpVYPT2wCVoy0baKV0ZLQykEMNqyI0u
	/+bGz1hvuPJ63jtZ4oQLhjXiG+Qm8x/y68g+2nrYWPk1AoHlY=
X-Received: by 2002:ad4:5c68:0:b0:91e:b488:5e30 with SMTP id 6a1803df08f44-91eef8a14acmr13718356d6.58.1794260562098;
        Mon, 09 Nov 2026 13:42:42 -0800 (PST)
X-Received: by 2002:ad4:5c68:0:b0:91e:b488:5e30 with SMTP id 6a1803df08f44-91eef8a14acmr13718036d6.58.1794260561451;
        Mon, 09 Nov 2026 13:42:41 -0800 (PST)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04ceadcsm5783616d6.19.2026.11.09.13.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 13:42:40 -0800 (PST)
Message-ID: <e2835e4f-3cb4-4b39-9a1d-a6b222e8bbb4@redhat.com>
Date: Mon, 9 Nov 2026 16:42:39 -0500
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Two copyright notices missing in 6.20?
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Alejandro Colomar <alx@kernel.org>, Xavier Leroy <Xavier.Leroy@inria.fr>,
 linux-man <linux-man@vger.kernel.org>, Michal Schorm <mschorm@redhat.com>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan> <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <aun6mEuYKQG-1IKv@devuan> <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>
 <au0J1MGwWEwdnUSK@devuan>
Content-Language: en-US
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
In-Reply-To: <au0J1MGwWEwdnUSK@devuan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 6:06 PM, Alejandro Colomar wrote:
> Actually, I've looked at memcpy(3), and the text I thought might have
> come from glibc is not present in the glibc manual, so I guess it's
> from this project only.  The text from glibc might have been replaced
> entirely over time.

Agreed.

> Now we have a Ship of Theseus problem here.  The page doesn't seem to
> contain any copyrighted text, but are we allowed to just drop that
> license notice?  Any suggestions about memcpy(3)?
I think at this point the interface is so well understood and the text
sufficiently simple that we can keep memcpy.3 as-is for 6.20+.

However, signbit.3 clearly says "Based on glibc infopages, copyright Free Software Foundation"

Likewise "heavily based on glibc infopages, copyright Free Software Foundation"

Both of these should be rewritten from scratch IMO if we're going to ship
something that is legally permissible without being GFDL.

I can't write these since I'm involved in reviewing artih.texi updates
for glibc.

I think anyone else could probably write them.

-- 
Cheers,
Carlos.

