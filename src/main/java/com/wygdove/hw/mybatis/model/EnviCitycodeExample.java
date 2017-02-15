package com.wygdove.hw.mybatis.model;

import java.util.ArrayList;
import java.util.List;

public class EnviCitycodeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EnviCitycodeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andAreaidIsNull() {
            addCriterion("AREAID is null");
            return (Criteria) this;
        }

        public Criteria andAreaidIsNotNull() {
            addCriterion("AREAID is not null");
            return (Criteria) this;
        }

        public Criteria andAreaidEqualTo(String value) {
            addCriterion("AREAID =", value, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidNotEqualTo(String value) {
            addCriterion("AREAID <>", value, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidGreaterThan(String value) {
            addCriterion("AREAID >", value, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidGreaterThanOrEqualTo(String value) {
            addCriterion("AREAID >=", value, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidLessThan(String value) {
            addCriterion("AREAID <", value, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidLessThanOrEqualTo(String value) {
            addCriterion("AREAID <=", value, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidLike(String value) {
            addCriterion("AREAID like", value, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidNotLike(String value) {
            addCriterion("AREAID not like", value, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidIn(List<String> values) {
            addCriterion("AREAID in", values, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidNotIn(List<String> values) {
            addCriterion("AREAID not in", values, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidBetween(String value1, String value2) {
            addCriterion("AREAID between", value1, value2, "areaid");
            return (Criteria) this;
        }

        public Criteria andAreaidNotBetween(String value1, String value2) {
            addCriterion("AREAID not between", value1, value2, "areaid");
            return (Criteria) this;
        }

        public Criteria andNameenIsNull() {
            addCriterion("NAMEEN is null");
            return (Criteria) this;
        }

        public Criteria andNameenIsNotNull() {
            addCriterion("NAMEEN is not null");
            return (Criteria) this;
        }

        public Criteria andNameenEqualTo(String value) {
            addCriterion("NAMEEN =", value, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenNotEqualTo(String value) {
            addCriterion("NAMEEN <>", value, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenGreaterThan(String value) {
            addCriterion("NAMEEN >", value, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenGreaterThanOrEqualTo(String value) {
            addCriterion("NAMEEN >=", value, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenLessThan(String value) {
            addCriterion("NAMEEN <", value, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenLessThanOrEqualTo(String value) {
            addCriterion("NAMEEN <=", value, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenLike(String value) {
            addCriterion("NAMEEN like", value, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenNotLike(String value) {
            addCriterion("NAMEEN not like", value, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenIn(List<String> values) {
            addCriterion("NAMEEN in", values, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenNotIn(List<String> values) {
            addCriterion("NAMEEN not in", values, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenBetween(String value1, String value2) {
            addCriterion("NAMEEN between", value1, value2, "nameen");
            return (Criteria) this;
        }

        public Criteria andNameenNotBetween(String value1, String value2) {
            addCriterion("NAMEEN not between", value1, value2, "nameen");
            return (Criteria) this;
        }

        public Criteria andNamecnIsNull() {
            addCriterion("NAMECN is null");
            return (Criteria) this;
        }

        public Criteria andNamecnIsNotNull() {
            addCriterion("NAMECN is not null");
            return (Criteria) this;
        }

        public Criteria andNamecnEqualTo(String value) {
            addCriterion("NAMECN =", value, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnNotEqualTo(String value) {
            addCriterion("NAMECN <>", value, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnGreaterThan(String value) {
            addCriterion("NAMECN >", value, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnGreaterThanOrEqualTo(String value) {
            addCriterion("NAMECN >=", value, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnLessThan(String value) {
            addCriterion("NAMECN <", value, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnLessThanOrEqualTo(String value) {
            addCriterion("NAMECN <=", value, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnLike(String value) {
            addCriterion("NAMECN like", value, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnNotLike(String value) {
            addCriterion("NAMECN not like", value, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnIn(List<String> values) {
            addCriterion("NAMECN in", values, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnNotIn(List<String> values) {
            addCriterion("NAMECN not in", values, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnBetween(String value1, String value2) {
            addCriterion("NAMECN between", value1, value2, "namecn");
            return (Criteria) this;
        }

        public Criteria andNamecnNotBetween(String value1, String value2) {
            addCriterion("NAMECN not between", value1, value2, "namecn");
            return (Criteria) this;
        }

        public Criteria andDistrictenIsNull() {
            addCriterion("DISTRICTEN is null");
            return (Criteria) this;
        }

        public Criteria andDistrictenIsNotNull() {
            addCriterion("DISTRICTEN is not null");
            return (Criteria) this;
        }

        public Criteria andDistrictenEqualTo(String value) {
            addCriterion("DISTRICTEN =", value, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenNotEqualTo(String value) {
            addCriterion("DISTRICTEN <>", value, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenGreaterThan(String value) {
            addCriterion("DISTRICTEN >", value, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenGreaterThanOrEqualTo(String value) {
            addCriterion("DISTRICTEN >=", value, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenLessThan(String value) {
            addCriterion("DISTRICTEN <", value, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenLessThanOrEqualTo(String value) {
            addCriterion("DISTRICTEN <=", value, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenLike(String value) {
            addCriterion("DISTRICTEN like", value, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenNotLike(String value) {
            addCriterion("DISTRICTEN not like", value, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenIn(List<String> values) {
            addCriterion("DISTRICTEN in", values, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenNotIn(List<String> values) {
            addCriterion("DISTRICTEN not in", values, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenBetween(String value1, String value2) {
            addCriterion("DISTRICTEN between", value1, value2, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictenNotBetween(String value1, String value2) {
            addCriterion("DISTRICTEN not between", value1, value2, "districten");
            return (Criteria) this;
        }

        public Criteria andDistrictcnIsNull() {
            addCriterion("DISTRICTCN is null");
            return (Criteria) this;
        }

        public Criteria andDistrictcnIsNotNull() {
            addCriterion("DISTRICTCN is not null");
            return (Criteria) this;
        }

        public Criteria andDistrictcnEqualTo(String value) {
            addCriterion("DISTRICTCN =", value, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnNotEqualTo(String value) {
            addCriterion("DISTRICTCN <>", value, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnGreaterThan(String value) {
            addCriterion("DISTRICTCN >", value, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnGreaterThanOrEqualTo(String value) {
            addCriterion("DISTRICTCN >=", value, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnLessThan(String value) {
            addCriterion("DISTRICTCN <", value, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnLessThanOrEqualTo(String value) {
            addCriterion("DISTRICTCN <=", value, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnLike(String value) {
            addCriterion("DISTRICTCN like", value, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnNotLike(String value) {
            addCriterion("DISTRICTCN not like", value, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnIn(List<String> values) {
            addCriterion("DISTRICTCN in", values, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnNotIn(List<String> values) {
            addCriterion("DISTRICTCN not in", values, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnBetween(String value1, String value2) {
            addCriterion("DISTRICTCN between", value1, value2, "districtcn");
            return (Criteria) this;
        }

        public Criteria andDistrictcnNotBetween(String value1, String value2) {
            addCriterion("DISTRICTCN not between", value1, value2, "districtcn");
            return (Criteria) this;
        }

        public Criteria andProvenIsNull() {
            addCriterion("PROVEN is null");
            return (Criteria) this;
        }

        public Criteria andProvenIsNotNull() {
            addCriterion("PROVEN is not null");
            return (Criteria) this;
        }

        public Criteria andProvenEqualTo(String value) {
            addCriterion("PROVEN =", value, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenNotEqualTo(String value) {
            addCriterion("PROVEN <>", value, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenGreaterThan(String value) {
            addCriterion("PROVEN >", value, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenGreaterThanOrEqualTo(String value) {
            addCriterion("PROVEN >=", value, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenLessThan(String value) {
            addCriterion("PROVEN <", value, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenLessThanOrEqualTo(String value) {
            addCriterion("PROVEN <=", value, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenLike(String value) {
            addCriterion("PROVEN like", value, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenNotLike(String value) {
            addCriterion("PROVEN not like", value, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenIn(List<String> values) {
            addCriterion("PROVEN in", values, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenNotIn(List<String> values) {
            addCriterion("PROVEN not in", values, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenBetween(String value1, String value2) {
            addCriterion("PROVEN between", value1, value2, "proven");
            return (Criteria) this;
        }

        public Criteria andProvenNotBetween(String value1, String value2) {
            addCriterion("PROVEN not between", value1, value2, "proven");
            return (Criteria) this;
        }

        public Criteria andProvcnIsNull() {
            addCriterion("PROVCN is null");
            return (Criteria) this;
        }

        public Criteria andProvcnIsNotNull() {
            addCriterion("PROVCN is not null");
            return (Criteria) this;
        }

        public Criteria andProvcnEqualTo(String value) {
            addCriterion("PROVCN =", value, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnNotEqualTo(String value) {
            addCriterion("PROVCN <>", value, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnGreaterThan(String value) {
            addCriterion("PROVCN >", value, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnGreaterThanOrEqualTo(String value) {
            addCriterion("PROVCN >=", value, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnLessThan(String value) {
            addCriterion("PROVCN <", value, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnLessThanOrEqualTo(String value) {
            addCriterion("PROVCN <=", value, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnLike(String value) {
            addCriterion("PROVCN like", value, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnNotLike(String value) {
            addCriterion("PROVCN not like", value, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnIn(List<String> values) {
            addCriterion("PROVCN in", values, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnNotIn(List<String> values) {
            addCriterion("PROVCN not in", values, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnBetween(String value1, String value2) {
            addCriterion("PROVCN between", value1, value2, "provcn");
            return (Criteria) this;
        }

        public Criteria andProvcnNotBetween(String value1, String value2) {
            addCriterion("PROVCN not between", value1, value2, "provcn");
            return (Criteria) this;
        }

        public Criteria andNationenIsNull() {
            addCriterion("NATIONEN is null");
            return (Criteria) this;
        }

        public Criteria andNationenIsNotNull() {
            addCriterion("NATIONEN is not null");
            return (Criteria) this;
        }

        public Criteria andNationenEqualTo(String value) {
            addCriterion("NATIONEN =", value, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenNotEqualTo(String value) {
            addCriterion("NATIONEN <>", value, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenGreaterThan(String value) {
            addCriterion("NATIONEN >", value, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenGreaterThanOrEqualTo(String value) {
            addCriterion("NATIONEN >=", value, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenLessThan(String value) {
            addCriterion("NATIONEN <", value, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenLessThanOrEqualTo(String value) {
            addCriterion("NATIONEN <=", value, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenLike(String value) {
            addCriterion("NATIONEN like", value, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenNotLike(String value) {
            addCriterion("NATIONEN not like", value, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenIn(List<String> values) {
            addCriterion("NATIONEN in", values, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenNotIn(List<String> values) {
            addCriterion("NATIONEN not in", values, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenBetween(String value1, String value2) {
            addCriterion("NATIONEN between", value1, value2, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationenNotBetween(String value1, String value2) {
            addCriterion("NATIONEN not between", value1, value2, "nationen");
            return (Criteria) this;
        }

        public Criteria andNationcnIsNull() {
            addCriterion("NATIONCN is null");
            return (Criteria) this;
        }

        public Criteria andNationcnIsNotNull() {
            addCriterion("NATIONCN is not null");
            return (Criteria) this;
        }

        public Criteria andNationcnEqualTo(String value) {
            addCriterion("NATIONCN =", value, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnNotEqualTo(String value) {
            addCriterion("NATIONCN <>", value, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnGreaterThan(String value) {
            addCriterion("NATIONCN >", value, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnGreaterThanOrEqualTo(String value) {
            addCriterion("NATIONCN >=", value, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnLessThan(String value) {
            addCriterion("NATIONCN <", value, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnLessThanOrEqualTo(String value) {
            addCriterion("NATIONCN <=", value, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnLike(String value) {
            addCriterion("NATIONCN like", value, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnNotLike(String value) {
            addCriterion("NATIONCN not like", value, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnIn(List<String> values) {
            addCriterion("NATIONCN in", values, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnNotIn(List<String> values) {
            addCriterion("NATIONCN not in", values, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnBetween(String value1, String value2) {
            addCriterion("NATIONCN between", value1, value2, "nationcn");
            return (Criteria) this;
        }

        public Criteria andNationcnNotBetween(String value1, String value2) {
            addCriterion("NATIONCN not between", value1, value2, "nationcn");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}