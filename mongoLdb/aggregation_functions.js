db.movies.aggregate([{$group:{_id:0, mediaEtaria: {$avg: "$Faixa_Etaria"}}}])