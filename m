Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636671;
	b=OrtikyWyzSgYTDcGjAbaG+Ezb6ChmOYsY2Fr7KBNQlMf9G3GG2q8vvNyJBrr0O43cD6c
	 x8dq+VojbrCpX4WK9xyMEkvEtufZt8w75RjUjZfNFQ7FWLZEe1di/eOGZdyTeRikxB4Zl
	 X65BUS6wp9/OCZcvuOmRJQDQC2P1oNRku9NePrfffPX5TCxphKDBoUktDhpIjJHYE8/GI
	 9ecRpg8gfKoXA6uTIw3tKFt4ZtUaDkpv0TbPkYsx7mqnK/xNXbnEtgFPY4EiAzzUhOwmC
	 G1VmeIjQKqe44Hu205sgGrgciA94PHzxFWQXqFvSB1uubJaqx9bKXVDT6+e0vPu2DVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636671;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:From:Subject:Autocrypt:Organization:
	 Content-Type:Content-Transfer-Encoding;
	bh=qc44Tpps2X/B+vLAw3SuODPh7k36/79NdMDlEeKO30w=;
	b=WgTuo9jwa3xzf5/pUB7pW7KrqaFRYW+Cvel16tc6BMEKnFDS5ga0NwmVM4WfFaOM7I7m
	 jcZIqA0gDb1da5NyCzQm3DU/4/Kk012F8YLytAEFY7aq7dvJdWp4MIj+CsMj5SFKdgsXb
	 TlqDYc7yRKyz+re6Ajk6lKYfqF6wnTfIG2q2qGQXoirHzcu2p3IoOAx10EN45BT4gDDPn
	 Kv0SJ1aO56vCrHVevT+AVzEuXnInpwgPGyi82N/JBp9vcn8Ys9bJI9xZ/h2PLnOLrLdDR
	 BSsYIJEsIM/2zBE0mOsqYRdUVSUuS/3ZrQ8qyDOmeRrkmq++q+h3+KhhQOkZfBkdnRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MPsEKaI6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=axDbgFK4;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BBF608508C
	for <linux-man@vger.kernel.org>; Mon,  2 Nov 2026 16:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51BBF608508C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MPsEKaI6;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=axDbgFK4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793636670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=qc44Tpps2X/B+vLAw3SuODPh7k36/79NdMDlEeKO30w=;
	b=MPsEKaI65zw/YD54/6AtMmTGI2UcCa4llA5B3ZdrwXys7xGhaybWymrc9e+RgK77PodTWc
	UkIzaClguNm2QSwW+XlH41k+jz1gggHbTgRdlF4a4fmX6QHFYqC6QPopEDDzOV88QEpJ2e
	8G+TupIMFMYuenyw35j/jSIFJxfRzys=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-ASMn3DZ0OuawdmwgTo9wmg-1; Mon, 02 Nov 2026 11:24:29 -0500
X-MC-Unique: ASMn3DZ0OuawdmwgTo9wmg-1
X-Mimecast-MFC-AGG-ID: ASMn3DZ0OuawdmwgTo9wmg_1793636668
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b92acedd9so93848586d6.2
        for <linux-man@vger.kernel.org>; Mon, 02 Nov 2026 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793636668; x=1794241468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qc44Tpps2X/B+vLAw3SuODPh7k36/79NdMDlEeKO30w=;
        b=axDbgFK4Bd9IBJrEhZYbJL2aHmHWgxvKvu77DkZHZ/Uor0U8Y79D5/+QN4UZThBJ+K
         WAlbyhdlNeQEvsig1n9/nbi460qN17HKwQN9+9Mcewa5MrDFG/DBKlOVvWsuU84l74FN
         7iEucUi80y/yV2Q6kgV8sp55Fvw9ka6KfgYw0+chRHMznmqiDYbzKTD7gG7Y1PT2Sg7T
         1tr02gQwq9QKgDQEjQKJDPtrQrxNAMSt4qtFhVIMr85dzDEqN/f5gI766Q0U3QaD8Z7/
         YJZzDxDJzwYT5vJ6shnlXgkZs0ojvnRxEpgB2yqZqWajpMmVInUTEdt70YUXp5vA1qSn
         eV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636668; x=1794241468;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qc44Tpps2X/B+vLAw3SuODPh7k36/79NdMDlEeKO30w=;
        b=hceD4di0y0jrlbz8ir3/vkcPyQcmK/+WwYYXjNvj5DbAzUNAe/GRdPWu00VaRlQQ5Q
         Adwb/JotBtkx3relBVRtayfMGEE1vql8JPrNT7loTC9sT7kxYbU1h45BCVXe3Qw9eqT5
         k4TheWaGfwBjYPsqdtf0PqfnQYHYFwb0xapbuZBsex9zXRuWhgToBiStUcFYtAlVGKQ7
         rxH1bjRKcp2wR/tqiFfnRPNN/NPUVzxSMMhq4gcsp3HDem1aM72nrPfeugt22T42BJGM
         WTJ3cqa+X5iLvCJ89BjJKVazR3zxsLANPL4Ux2Vc7H4zZ8y1NVJ3Y0sTfYQL41ts9CaW
         M9+A==
X-Forwarded-Encrypted: i=1; AKwUvBzWLM2MZgm4pN6AjpSL/2ydJ2GqPYyRImiMJzyQB8hpH5U915v46ulh64TFGWQrRVPL11nz6+Ik/IY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Wh0AchI2o2zhvG2hASKS3T36/vhYY80W5Pk/qYhhMW5o5Mwi
	/Q2e5MExelbo7Flm1cW4pb26HOGuxOJ9KStI61pWEX1aW/Qa1V9ogFQO8vhN6rsHuz0IzKYMhwf
	xUHGpSZtddx8trkG1NQLPOa00qYceuqfdxT5mvUZ6LCuqfLmHrfQbWkbVRnXQSfHb9utFog==
X-Gm-Gg: AYBFou1OC6alN0MDA+fNs6H7XRXHDDnt65PGwsP1aqSwj0eqcJCJMELVgTvLoPAy8to
	uuzrIYGYRenLJadYD9uzKWnZYRYh+ZOD4K6xyLFK38P3gN8rDHAPzd9ZKmq2i0LThhFEIAzRoVu
	eFT3hXinf1GNuj4n8qt+5a2wledbZSaXJelZ6iL6HcaXHAOhmA4VF8PBIDDpGjG6Z6e3v/DZFwO
	llglI3lwAOpqmRZyC711wcOetfDMwNQs2jalkjshY4jrEVimUV60FoFvJbtzBSHDy6qYFsuvBtr
	rRFjGGFTn6/ys9ehXzPNdM9J0GCQt1+JGm0tDulU8jAS+QJLs7jgXeFf+Q5j4nPbBvEvSQhpYg5
	OIhb0zU2tKB48+douzbrtNQcydwrNw/koyW3O5WbA+4UZIbKE9/uQQqQ/rh6slx9kz54Hv0g0UR
	oEwcMf7MakXnn+8naUVR8PI10SD/Kr2Rv0/N7iF7u5VJnyBF8=
X-Received: by 2002:ad4:5cc8:0:b0:91c:8f4b:4529 with SMTP id 6a1803df08f44-91ca4b78927mr187106736d6.24.1793636668360;
        Mon, 02 Nov 2026 08:24:28 -0800 (PST)
X-Received: by 2002:ad4:5cc8:0:b0:91c:8f4b:4529 with SMTP id 6a1803df08f44-91ca4b78927mr187106066d6.24.1793636667709;
        Mon, 02 Nov 2026 08:24:27 -0800 (PST)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91cb4478981sm64951166d6.35.2026.11.02.08.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:24:26 -0800 (PST)
Message-ID: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
Date: Mon, 2 Nov 2026 11:24:25 -0500
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
Content-Language: en-US
To: Alejandro Colomar <alx@kernel.org>, linux-man <linux-man@vger.kernel.org>
Cc: Michal Schorm <mschorm@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Subject: Two copyright notices missing in 6.20?
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Alejandro,

I did a quick audit through 6.20 since we're looking to ship an update in Fedora.

- Linus Torvalds — setreuid.2
- Xavier Leroy — pthread_once.3

At the top level the following people have had their notices removed but I didn't
see them acknowledge that removal on the mailing list, or in your final audit here:
https://lore.kernel.org/linux-man/unavr5u2uynqfvj7iymgvsptq4k5s5b4ex7havl36zro4bbua4@fqpjhnsuu5ln/

Should we add these back?

I can only assume the Michael Kerrisk consented, but I don't think you explicitly
mentioned this in any email I read with a Message-id. Would you do so for the record?

-- 
Cheers,
Carlos.

