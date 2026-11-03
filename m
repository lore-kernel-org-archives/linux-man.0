Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728560;
	b=wtAVvMZrOkRGsVtJABjG7YHl6EPw3tv/CvZPfRCRVaWpkPg3m2sD0BbAaqY3u9gARvTe
	 4A6TVPb4verXzGxiFIj7GhHVenS78neBMc7DM/lfu9sFfKYpA7AtQikWBLhXLY+C/0SmI
	 ne528iIjvBn+HtjxCVfiC3FfR9d1MRxDmw5K+T+5mDvf7uhYEsnFIGQxqEwVRZEF0vHlc
	 e1a0s2WP5rVXZr/Q65QL9Bx56PVBmxUVN9IIbY86nV0EIM+cTnq0OgHsTxpFibXqYBsSA
	 0HPXvnPMzee63JjXi6tADiKLzIgg7t06s3I9MSPQ82eub9cIng8CQMuWLeFX0KwDQAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728560;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EtaiFmyJdB3cRsy0RTJUJ4ugHdvvYchw7yOyzGjQtgQ=;
	b=1YWZxvbA/ELnJVotUcl19NBLLiiAMjispPdcCvd4eWshD6aZJousjTJMITXny5WhBmfy
	 QP+BeZe871XUCW5QqnvYT48S2iquA8/fR+nIRt8Us27L+YSf3+0G8doUWxEmJEyqAgggJ
	 a+yr6IpVu1HUimF46XZLAUOYEgXdbxK9MuSOIWezXOJPSLKBN1OANvt0pveOoednav4wK
	 1H6XKhtPXREkNFc3ErnH7OFKl/G369Luqd7SMVivMyHMyGArAgcfiwcPdQ6DUwq58Hhow
	 jOIIA9z35YJIImAgjKiY4DT2jPEFUSTkMxntwFOASuyAczaXrmSmy4Qol6TkImBv4Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f9BT7YeR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KPKpzuao;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46B606A324
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 17:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC46B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f9BT7YeR;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KPKpzuao
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793728558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EtaiFmyJdB3cRsy0RTJUJ4ugHdvvYchw7yOyzGjQtgQ=;
	b=f9BT7YeR+XdP3U+tby5spCGf8TrZW4P2XaMFYYxZSA53ll57VZXngtLnVeMXGuHd7KJNHu
	y4QADdYYHjsI7e67xBHSSUGsUPaAtmBwE6JAc2/BvTolJl6vMqvfzO7MvQU1tF+R7EhwGv
	0nvnoc9DH4R0xtJU51oZjbuCHJFOTyE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-kjr6-hDoM6-TSER850awbw-1; Tue, 03 Nov 2026 12:55:57 -0500
X-MC-Unique: kjr6-hDoM6-TSER850awbw-1
X-Mimecast-MFC-AGG-ID: kjr6-hDoM6-TSER850awbw_1793728557
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0c6e7151cso71164707b3.1
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 09:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793728557; x=1794333357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EtaiFmyJdB3cRsy0RTJUJ4ugHdvvYchw7yOyzGjQtgQ=;
        b=KPKpzuaoY83bHbHASw2ypQWdnzSkI689fOivG6JYYLjaHuB5QE9aL/V4j9BsxDGT5r
         BYo0F1srjmGGcgk7Wnqg+na5YZF6dgU81VgQA5U9f6RJMmlGiNpqziUt3ejL+GtoNNy5
         xTmDHJ4SBnWElJRv4b/4bnLMuNxAAtaiCzPWParh3W3eFz5dT9q9RugDSBshRS4Yd7DY
         kylmkJyVE211UBLFckvFTLj25AMPVTU5CzxicVmAX0zTUMikqtVWxWBhCG3JgsYD1pZ1
         pDO90ggVF9wlIdrIwMOhogDWr1JSSlw+Waq+SO30j2yyzECotzS7d4q2gN3asOEBwrca
         F3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728557; x=1794333357;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EtaiFmyJdB3cRsy0RTJUJ4ugHdvvYchw7yOyzGjQtgQ=;
        b=M8G0uXjv9gGbrU+lb6/TJibRL9ezbrw4vpk36sElJvYX2cL+M8bA0hD8P1Fl3AeBnv
         exJsv16DYCxL82zAHiOxIdYdC4LST13eff8s5394PL68WH6ychDBEMOgA+6W8VRKy4U5
         +t4iX+sy3XXiL6InZ8iFaa9XHU/dYUEaHF2DQ8UYF4SBVuJVdMaLeT7tkxpX3HyKgOYW
         Ur71BtZeTjO+1kcXwk1XNWCvL2PIZvVH343G2v7+0U4MkmyHLM3a6519tPztoumu5mSf
         2tFuwlnFFjK3HnBOhxY9Goe9bc3rt8DANGFMJo/VIWtcLxfBGjvw1qE3wlTIeJnPDmEk
         jyrg==
X-Forwarded-Encrypted: i=1; AKwUvBwtPakrKQDsH+Ds4dN32syNNkQDzD6tnOtaIwCc/CWzUvh1AKTr3QchuwW0qD7KNGHDqqk8e36Dpq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GpNAp51NHy8cGzrSmMV9tG4eboikwALJwIjsAFDhISrb53tR1
	/51w08dBrmE8JbgM6NozFIHFF0AjoX02S8WY0UNpCVGB7i1iwUWejiPCorNOj5CvPI/PFAthvpB
	BSQK4T7H/8uDXQwfGlIylt8zVXajYPRrYdH2AItIsAbFfaFWbj8DBLxnW2tklJg==
X-Gm-Gg: AYBFou0dr4dxZJ/QzkBXwYgoeiNmK0/xzXvxfPFJl6GBatXLrIobthLUQQHT7XJPE+A
	6ZwmFjCfY5MRnPmIkvm3pviVeJ66VGUEblkSJKkuryRDMWbPk4krL5Dc6shwvaYeAVz3MBS16iz
	6ZOG85KRnBL2oHwcqAFo3hlXuKh3LlvTehM8RmAvqdoe3u02R8eAV8FEQDW7YMExlFVqywamS8T
	3L0d5eNSN39e2OnpMeBhXWRBG6u2s1ERdVZ68G11Z4sDyvaJIOfak17KltOZEoYHrnCTbGu+rdH
	LQjBzfAIVyeSJqNpSqbMFQ8OfdxVwcZy7NeKWb3A/TaTfrFobmDRH1wLLJBVoxxSdMR2pQO/o6Y
	RZhj55l4WE3nsMC/rEEPVE9qX6c3IGM3T8xUtVIIAzaCmTsJuX0ltS0BP/Ql4RMuwuqi4kZG7AY
	jIgB7OJAcOEaZa8h89jPdfTUOwDDsXvliC0HDQr23Ldg0x30s=
X-Received: by 2002:a05:690c:f05:b0:8af:e4ee:a915 with SMTP id 00721157ae682-8b2b675e73dmr78080117b3.44.1793728556756;
        Tue, 03 Nov 2026 09:55:56 -0800 (PST)
X-Received: by 2002:a05:690c:f05:b0:8af:e4ee:a915 with SMTP id 00721157ae682-8b2b675e73dmr78080047b3.44.1793728556252;
        Tue, 03 Nov 2026 09:55:56 -0800 (PST)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3097117b3sm1929287b3.1.2026.11.03.09.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:55:54 -0800 (PST)
Message-ID: <e9634fc8-26be-485d-8bf5-ed32098a8ae2@redhat.com>
Date: Tue, 3 Nov 2026 12:55:53 -0500
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
Subject: Re: copyright year ranges and "collapse"
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 Alejandro Colomar <alx@kernel.org>
Cc: Xavier Leroy <Xavier.Leroy@inria.fr>,
 linux-man <linux-man@vger.kernel.org>, Michal Schorm <mschorm@redhat.com>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan> <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <20261103165448.3y5ujyzvgypygjgj@illithid>
Content-Language: en-US
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 xsFNBFef5BoBEACvJ15QMMZh4stKHbz0rs78XsOdxuug37dumTx6ngrDCwZ61k7nHQ+uxLuo
 QvLSc6YJGBEfiNFbs1hvhRFNR7xJbzRYmin7kJZZ/06fH2cgTkQhN0mRBP8KsKKT+7SvvBL7
 85ZfAhArWf5m5Tl0CktZ8yoG8g9dM4SgdvdSdzZUaWBVHc6TjdAb9YEQ1/jpyfHsQp+PWLuQ
 ZI8nZUm+I3IBDLkbbuJVQklKzpT1b8yxVSsHCyIPFRqDDUjPL5G4WnUVy529OzfrciBvHdxG
 sYYDV8FX7fv6V/S3eL6qmZbObivIbLD2NbeDqw6vNpr+aehEwgwNbMVuVfH1PVHJV8Qkgxg4
 PqPgQC7GbIhxxYroGbLJCQ41j25M+oqCO/XW/FUu/9x0vY5w0RsZFhlmSP5lBDcaiy3SUgp3
 MSTePGuxpPlLVMePxKvabSS7EErLKlrAEmDgnUYYdPqGCefA+5N9Rn2JPfP7SoQEp2pHhEyM
 6Xg9x7TJ+JNuDowQCgwussmeDt2ZUeMl3s1f6/XePfTd3l8c8Yn5Fc8reRa28dFANU6oXiZf
 7/h3iQXPg81BsLMJK3aA/nyajRrNxL8dHIx7BjKX0/gxpOozlUHZHl73KhAvrBRaqLrr2tIP
 LkKrf3d7wdz4llg4NAGIU4ERdTTne1QAwS6x2tNa9GO9tXGPawARAQABzSpDYXJsb3MgTydE
 b25lbGwgKFdvcmspIDxjYXJsb3NAcmVkaGF0LmNvbT7CwZUEEwEIAD8CGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEcnNUKzmWLfeymZMUFnkrTqJTQPgFAmod99EFCRRfRy8ACgkQ
 FnkrTqJTQPiF+hAAhstxT3ao2pBuNQNh7/yieJxsQ0YrI0vZeIMM/P5kxzr0X/+CNCFx/bbk
 ogjOVgVMUD1WzqW6zY8lsj3/RPiBsowZBJYXIsWfdvYq33WwgtiXA/1AUZ60/lfWIQdPQJDL
 8/FXzRy8P4B/DoSpMOU11S5Kk8j5R9mBk/NSrNreO/nB1e4qNFF5GluBUsxMjKrGkkOxUZPQ
 uGNjcgdxRibNVD8n+lp9UU9+rsFKNOK7F0l9/ltR6j8kVagMKikXsaoUFU6WUbGHQ+ZBPdY8
 o8izXbQLoW/kD1qxbMsviBPaszaRZTyKd4ZEz54dx4up3vLorBoLI6YcG2oTqIdx8YZSXdfK
 WVPhQsJKG/QgiPztGYzT93KvhHlQ3+D9GZBU0ovAWc4YkBjxLPsw4DLhgFGLgIGhFHuMY3jy
 qlzez8KpoehH7mEgc5yGBtbnejnhuo7N6q6SUEGcSWlyLsdHMPZOg2UhpJ4pS9u7vG9Cz7+b
 yxItTMJ0XhRjQIkdm+38lH1yaOqVU9jvTgpPf3P9vT3Xo5vCa8PM5U7oL/Be2O6JH4hj9835
 h0AJfKsDJD50OgS9zI8e51X+vSTir1Kk+tMJJgZLYqYsSKOwUm+vVLby1pK171lIuu1qjx6I
 Rqz9CxmD5iRWIeIaOGGI+gce4eeMBH1IbFS6EjHT2hu+AfoURjjOwU0EV5/kGgEQAKvTJke+
 QSjATmz11ALKle/SSEpUwL5QOpt3xomEATcYAamww0HADfGTKdUR+aWgOK3vqu6Sicr1zbuZ
 jHCs2GaIgRoqh1HKVgCmaJYjizvidHluqrox6qqc9PG0bWb0f5xGQw+X2z+bEinzv4qaep1G
 1OuYgvG49OpHTgZMiJq9ncHCxkD2VEJKgMywGJ4Agdl+NWVn0T7w6J+/5QmBIE8hh4NzpYfr
 xzWCJ9iZ3skG4zBGB4YEacc3+oeEoybc10h6tqhQNrtIiSRJH+SUJvOiNH8oMXPLAjfFVy3d
 4BOgyxJhE0UhmQIQHMJxCBw81fQD10d0dcru0rAIEldEpt2UXqOr0rOALDievMF/2BKQiOA7
 PbMC3/dwuNHDlClQzdjil8O7UsIgf3IMFaIbQoUEvjlgf5cm9a94gWABcfI1xadAq9vcIB5v
 +9fM71xDgdELnZThTd8LByrG99ExVMcG2PZYXJllVDQDZqYA1PjD9e0yHq5whJi3BrZgwDaL
 5vYZEb1EMyH+BQLO3Zw/Caj8W6mooGHgNveRQ1g9FYn3NUp7UvS22Zt/KW4pCpbgkQZefxup
 KO6QVNwwggV44cTQ37z5onGbNPD8+2k2mmC0OEtGBkj+VH39tRk+uLOcuXlGNSVk3xOyxni0
 Nk9M0GvTvPKoah9gkvL/+AofN/31ABEBAAHCwXwEGAEIACYCGwwWIQRyc1QrOZYt97KZkxQW
 eStOolNA+AUCah337wUJFF9HVQAKCRAWeStOolNA+FSnD/sHeLb9vaXHABC/1eyrScwSDfZs
 MFsdjzZZqGbnbdj4uP4oyt3uztsxJASgHRQ/DhaPsms3Ai+kWhf5EHOBC9cPSn0aHZL52nT+
 MdbTu2VvvVRfECSm+lo/NkTGoXkF+n6TFd7tQGmSjdudvUhiKfSzep3GYseknmb9+7/DGluv
 QjuDb8quUVglMifp3qRUH4yPo7BS8ak59t4FUc8m2ggglgcvzKCRgqgEtrP2vM6EFzUiRJ1Y
 0et5kedtiAI1e9ehVeyytFELputja7EzAxWv+pQ2m/jhfoAHx/FTqw4PdrtH2zY9SmCheWDE
 wIgA+eyAHTG/X5DFq2P45agY6K+cvlDvr6V2NDsoOYI91A0VKahKkNIDAsMJ7sqMys/qw9kp
 dJVZaDqoNdY9NtDayLWXPXyJZEAy0Xsvw0vdoswthtjQmeZWhx2fMSCwG8mQlAya+nnfalPi
 iuPL6BUkk7naKk9wHpEZDMlyp6CLefLe1ioVFhnN2nL5SseY9nnmDo05lidf11U4VVWsVHJ+
 ViM9CQLD+NCazBNavYUPBEpFuT7HX4zWfpTNU9GXbEYcvrUb6Oo59/9ns7e9stTuskyxxxyY
 ryfF9FLmLQkM9soiwxGIt6k7ObkNsBRYzuM5q1lmDV6MA1llxUPmf9e5b3OFJ7gqXeRZ5niK
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
In-Reply-To: <20261103165448.3y5ujyzvgypygjgj@illithid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 11:54 AM, G. Branden Robinson wrote:
> I am not a lawyer.  This is not legal advice.  The expertise I don't
> possess is limited to the United States.  Your mileage may vary.

I disagree.

I will note that this has come up in other communities.

Guidance given by the GNU Project and the FSF is to keep the years
distinct if they do not form a continuous range.

https://www.gnu.org/prep/maintain/html_node/Copyright-Notices.html

~~~
You can use a range (‘2008-2010’) instead of listing individual years
(‘2008, 2009, 2010’) if and only if: 1) every year in the range,
inclusive, really is a “copyrightable” year that would be listed
individually; and 2) you make an explicit statement in a README file
about this usage:

     For any copyright year range specified as YYYY-ZZZZ in this package
     note that the range specifies every single year in that closed
     interval.
~~~

The man pages project can choose differently.

I agree with the guidance because it is more accurate, promotes
eventual entry into the public domain, and can be referenced without
access to source control.

My understanding is that under US Copyright the years may be collapsed
without invalidating the statutory copyright statement.

I leave this up to Alejandro to decide.

-- 
Cheers,
Carlos.

